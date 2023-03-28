import 'package:dartz/dartz.dart';

import 'package:wallpaper_app/core/error/failure.dart';

import 'package:wallpaper_app/feature/home/domain/entity/response_entity/photo_response.dart';
import 'package:wallpaper_app/feature/search/data/model/search_request_model.dart';

import 'package:wallpaper_app/feature/search/domain/entity/search_request_entity.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/network/network_info.dart';
import '../../../home/data/model/response/photo_response_model.dart';
import '../../domain/repository/search_photo_repository.dart';
import '../data_sorce/search_remote_data_sorce.dart';

class SearchPhotoRepositoryImp implements SearchPhotoRepository {
  final SearchPhotoRemoteDataSource remoteDataSource;
  final NetWorkInfo netWorkInfo;

  SearchPhotoRepositoryImp(
    this.remoteDataSource,
    this.netWorkInfo,
  );

  @override
  Future<Either<Failure, PhotoResponseEntity>> getPhotos(
      SearchRequestEntity searchRequestEntity) async {
    if (await netWorkInfo.isConnected) {
      try {
        final PhotoResponseModel response = await remoteDataSource
            .getPhotos(SearchRequestModel.opj(searchRequestEntity));

        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
