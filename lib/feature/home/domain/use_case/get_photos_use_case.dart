import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entity/response_entity/photo_response.dart';
import '../repository/photo_repository.dart';


class GetPhotosUseCase extends BaseUseCase<PhotoResponseEntity, int > {
  PhotoRepository repository;
  GetPhotosUseCase({required this.repository});

  @override
  Future<Either<Failure, PhotoResponseEntity>> call(int page) async {
    return await repository.getPhotos(page);
  }
}
