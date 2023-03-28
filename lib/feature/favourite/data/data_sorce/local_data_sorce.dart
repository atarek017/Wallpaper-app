import 'dart:developer';
import '../../../../core/local_data_sorce/database_helper.dart';
import '../../../home/data/model/response/photo_response_model.dart';

abstract class FavoriteLocalDataSource {
  Future<List<PhotoModel>> getPhotos();
}

class FavoriteLocalDataSourceImp extends FavoriteLocalDataSource {
  final DatabaseDataSource databaseDataSource;

  FavoriteLocalDataSourceImp(this.databaseDataSource);

  @override
  Future<List<PhotoModel>> getPhotos() async {
    try {
      List<PhotoModel> result = await databaseDataSource.getPhotoList();
      return result;
    } catch (error) {
      log("Error:$error");
      rethrow;
    }
  }
}
