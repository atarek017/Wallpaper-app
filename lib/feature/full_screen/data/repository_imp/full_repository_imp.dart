import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:wallpaper_app/core/error/failure.dart';

import 'package:wallpaper_app/feature/home/domain/entity/response_entity/photo_response.dart';

import '../../../../core/error/error_handler.dart';
import '../../../home/data/model/response/photo_response_model.dart';
import '../../domain/repository/full_repository.dart';
import '../data_sorce/local_data_sorce.dart';

class FullRepositoryImp extends FullRepository {
  FullLocalDataSource localDataSource;

  FullRepositoryImp(this.localDataSource);
  /// add favorite
  @override
  Future<Either<Failure, bool>> addFavorite(PhotoEntity photoEntity) async {
    try {
      final bool response = await localDataSource.addFavorite(PhotoModel.opj(photoEntity));

      return Right(response);
    } catch (error) {
      log("Catch int LabRepositoryImp >>searchForLabs Error: $error");
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
