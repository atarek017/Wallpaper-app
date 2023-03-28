import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entity/response_entity/photo_response.dart';
import '../../../domain/use_case/get_photos_use_case.dart';

part 'photo_event.dart';

part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  GetPhotosUseCase getPhotosUseCase;
  ScrollController scrollController = ScrollController();
  bool _hasNextPage = true;
  int _currentPage = 1;
  List<PhotoEntity> _photoList = [];

  PhotoBloc(this.getPhotosUseCase) : super(PhotoInitial()) {
    /// get photo
    on<GetPhoto>((event, emit) async {
      emit(PhotoLoading());
      final response = await getPhotosUseCase(1);

      response.fold((failure) {
        emit(PhotoFail(failure));
      }, (photoResponse) {
        _hasNextPage = photoResponse.hasNextPage;

        _photoList = photoResponse.photos;
        emit(
          PhotoSuccess(photosList: _photoList),
        );
      });
    });

    /// Load More photo
    on<GetMorePhoto>((event, emit) async {
      final response = await getPhotosUseCase(event.page);

      response.fold((failure) {
        emit(PhotoFail(failure));
      }, (photoResponse) {
        _hasNextPage = photoResponse.hasNextPage;

        _photoList = _photoList + photoResponse.photos;

        emit(
          PhotoSuccess(photosList: _photoList),
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
          GetMorePhoto(
            _currentPage,
          ),
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
