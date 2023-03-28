import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/resources/constant.dart';

import '../../../../core/network/network_service.dart';
import '../../../home/data/model/response/photo_response_model.dart';
import '../model/search_request_model.dart';

abstract class SearchPhotoRemoteDataSource {
  Future<PhotoResponseModel> getPhotos(SearchRequestModel searchRequestModel);
}

class SearchPhotoRemoteDataSourceImp implements SearchPhotoRemoteDataSource {
  NetworkService networkService;
  Dio dio;

  SearchPhotoRemoteDataSourceImp(
    this.networkService,
    this.dio,
  );

  @override
  Future<PhotoResponseModel> getPhotos(
      SearchRequestModel searchRequestModel) async {
    try {
      final response = await networkService.get(
        Constants.search,
        queryParameters: searchRequestModel.toJson(),
      );
      return PhotoResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
