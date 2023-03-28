import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper_app/core/error/failure.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';

import '../../../../home/domain/entity/response_entity/photo_response.dart';
import '../../../domain/use_case/add_image_to_favorite.dart';

part 'full_image_event.dart';

part 'full_image_state.dart';

class FullImageBloc extends Bloc<FullImageEvent, FullImageState> {
  AddFavoritePhotosUseCase addFavoritePhotosUseCase;

  FullImageBloc(this.addFavoritePhotosUseCase) : super(FullImageInitial()) {
    /// on Download
    on<DownloadImage>((event, emit) async {
      await GallerySaver.saveImage(event.imageUrl).then((value) =>
          emit(FullImageSuccess(message: AppStrings.downloadedSuccess)));
    });

    /// set wall paper
    on<SetImageWallPaper>((event, emit) async {
      try {
        int location = WallpaperManager
            .BOTH_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
        var file = await DefaultCacheManager().getSingleFile(event.imageUrl);
        await WallpaperManager.setWallpaperFromFile(file.path, location);

        emit(FullImageSuccess(message: AppStrings.wallPaperSuccess));
      } on PlatformException {}
    });

    /// add favorite
    on<AddImageToFavourite>((event, emit) async {
      event.photoEntity.liked = true;
      final response = await addFavoritePhotosUseCase(event.photoEntity);
      response.fold((failure) {
        event.photoEntity.liked = false;

        emit(FullImageFail(failure));
      }, (photoResponse) {
        emit(
          FullImageSuccess(message: AppStrings.addedToFavSuc),
        );
      });
    });
  }
}
