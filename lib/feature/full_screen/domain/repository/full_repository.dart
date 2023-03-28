import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../home/domain/entity/response_entity/photo_response.dart';

abstract class FullRepository{
  Future<Either<Failure, bool>> addFavorite(PhotoEntity photoEntity);

}