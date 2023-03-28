import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../home/domain/entity/response_entity/photo_response.dart';
import '../entity/search_request_entity.dart';

abstract class SearchPhotoRepository {
  Future<Either<Failure, PhotoResponseEntity>> getPhotos(
      SearchRequestEntity searchRequestEntity);
}
