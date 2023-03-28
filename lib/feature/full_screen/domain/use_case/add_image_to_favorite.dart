import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../home/domain/entity/response_entity/photo_response.dart';
import '../repository/full_repository.dart';


class AddFavoritePhotosUseCase extends BaseUseCase<bool, PhotoEntity > {
  FullRepository repository;
  AddFavoritePhotosUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(PhotoEntity photoEntity) async {
    return await repository.addFavorite(photoEntity);
  }
}
