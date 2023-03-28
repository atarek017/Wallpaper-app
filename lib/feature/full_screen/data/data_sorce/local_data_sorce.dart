import 'dart:developer';
import '../../../../core/local_data_sorce/database_helper.dart';
import '../../../home/data/model/response/photo_response_model.dart';

abstract class FullLocalDataSource {
  Future<bool> addFavorite(PhotoModel photoModel);
}

class FullLocalDataSourceImp extends FullLocalDataSource {
  final DatabaseDataSource databaseDataSource;

  FullLocalDataSourceImp(this.databaseDataSource);

  @override
  Future<bool> addFavorite(PhotoModel photoModel) async {
    try {
      int result = await databaseDataSource.savePhotoData(photoModel);
      return (result > 0);
    } catch (error) {
      log("Error:$error");
      rethrow;
    }
  }
}
