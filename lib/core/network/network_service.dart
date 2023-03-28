import 'package:dio/dio.dart';

abstract class NetworkService {
  Future<Response> post(String url, dynamic data,
      {Map<String, dynamic>? queryParameters});

  Future<Response> get(String url, {Map<String, dynamic>? queryParameters});
}

class NetworkServicesImp implements NetworkService {
  final Dio dio;

  NetworkServicesImp(this.dio);

  /// post
  @override
  Future<Response> post(String url, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// get
  @override
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await dio.get(
        url,
        queryParameters: queryParameters
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
