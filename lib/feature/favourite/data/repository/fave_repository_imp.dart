import 'package:dartz/dartz.dart';

import 'package:wallpaper_app/core/error/failure.dart';
import 'package:wallpaper_app/feature/home/domain/entity/response_entity/photo_response.dart';


import '../../../../core/error/error_handler.dart';
import '../../../home/data/model/response/photo_response_model.dart';
import '../../domain/repository/fave_repository.dart';
import '../data_sorce/local_data_sorce.dart';

class FaveRepositoryImp implements FaveRepository {
  FavoriteLocalDataSource favoriteLocalDataSource;
  FaveRepositoryImp(this.favoriteLocalDataSource);

  @override
  Future<Either<Failure,  List<PhotoEntity> >> getFaveImages() async {
    try {
      List<PhotoModel> response =
          await favoriteLocalDataSource.getPhotos();

      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
