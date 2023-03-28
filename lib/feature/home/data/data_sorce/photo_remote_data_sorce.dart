import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/resources/constant.dart';

import '../../../../core/network/network_service.dart';
import '../model/response/photo_response_model.dart';

abstract class PhotoRemoteDataSource {
  Future<PhotoResponseModel> getPhotos(int page);
}

class PhotoRemoteDataSourceImp extends PhotoRemoteDataSource {
  NetworkService networkService;
  Dio dio;

  PhotoRemoteDataSourceImp(
    this.networkService,
    this.dio,
  );

  @override
  Future<PhotoResponseModel> getPhotos(int page) async {
    try {
      final response =
          await networkService.get("${Constants.curated}?page=$page");
      return PhotoResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
