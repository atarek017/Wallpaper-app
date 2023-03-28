import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/response_entity/photo_response.dart';

abstract class PhotoRepository {
  Future<Either<Failure, PhotoResponseEntity>> getPhotos(int page);
}
