import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/error/failure.dart';
import 'package:wallpaper_app/feature/home/domain/entity/response_entity/photo_response.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../domain/use_case/get_fave_use_case.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  GetFaveImageUseCase getFaveImageUseCase;

  FavouriteBloc(this.getFaveImageUseCase) : super(FavouriteInitial()) {
    /// get photos
    on<GetFavPhoto>((event, emit) async {
      emit(FavouriteLoading());
      final response = await getFaveImageUseCase(const NoParameters());

      response.fold((failure) {
        emit(FavouriteFailure(failure));
      }, (photoList) {
        if (photoList.isNotEmpty) {
          emit(
            FavouriteSuccess(photoList),
          );
        } else {
          emit(FavouriteEmpty());
        }
      });
    });
  }
}
