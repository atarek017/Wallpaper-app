import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/core/error/failure.dart';
import 'package:wallpaper_app/feature/home/domain/entity/response_entity/photo_response.dart';
import 'package:wallpaper_app/feature/home/domain/repository/photo_repository.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/network/network_info.dart';
import '../data_sorce/photo_remote_data_sorce.dart';
import '../model/response/photo_response_model.dart';

class PhotoRepositoryImp implements PhotoRepository {
  final PhotoRemoteDataSource remoteDataSource;
  final NetWorkInfo netWorkInfo;

  PhotoRepositoryImp(
      this.remoteDataSource, this.netWorkInfo,);

  /// get Photos
  @override
  Future<Either<Failure, PhotoResponseEntity>> getPhotos(int page) async {
    if (await netWorkInfo.isConnected) {
      try {
        final PhotoResponseModel response =
            await remoteDataSource.getPhotos(page);

        return Right(response);
      } catch (error) {
        log("Catch int PhotoRepositoryImp >>getPhotos Error: $error");
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


}
