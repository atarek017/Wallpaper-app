import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/error/failure.dart';
import 'package:wallpaper_app/feature/search/domain/entity/search_request_entity.dart';

import '../../../home/domain/entity/response_entity/photo_response.dart';
import '../../domain/use_case/serch_photo_use_case.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchPhotosUseCase searchPhotosUseCase;

  bool _hasNextPage = true;
  int _currentPage = 1;
  List<PhotoEntity> _photoList = [];
  ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  SearchBloc(this.searchPhotosUseCase) : super(SearchInitial()) {
    /// get photo
    on<SearchPhotoEvent>((event, emit) async {
      emit(SearchPhotoLoading());
      final response = await searchPhotosUseCase(event.searchRequestEntity);

      response.fold((failure) {
        emit(SearchPhotoFail(failure));
      }, (photoResponse) {
        _hasNextPage = photoResponse.hasNextPage;
        _photoList = photoResponse.photos;

        if (photoResponse.photos.isNotEmpty) {
          emit(
            SearchPhotoSuccess(_photoList),
          );
        } else {
          emit(SearchPhotoEmpty());
        }
      });
    });

    /// Load More photo
    on<SearchMorePhoto>((event, emit) async {
      final response = await searchPhotosUseCase(event.searchRequestEntity);

      response.fold((failure) {
        emit(SearchPhotoFail(failure));
      }, (photoResponse) {
        _hasNextPage = photoResponse.hasNextPage;

        _photoList = _photoList + photoResponse.photos;

        emit(
          SearchPhotoSuccess(_photoList),
        );
      });
    });

    /// scroll Controller
    scrollController.addListener(() {
      _onScroll();
    });
  }

  void _onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      _currentPage++;
      if (_hasNextPage) {
        add(
          SearchMorePhoto(SearchRequestEntity(
            query: searchController.text,
            page: _currentPage,
          )),
        );
      }
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
