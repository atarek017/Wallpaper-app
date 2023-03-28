import 'package:dartz/dartz.dart';
import 'package:wallpaper_app/core/usecase/base_usecase.dart';

import '../../../../core/error/failure.dart';
import '../../../home/domain/entity/response_entity/photo_response.dart';
import '../entity/search_request_entity.dart';
import '../repository/search_photo_repository.dart';

class SearchPhotosUseCase extends BaseUseCase<PhotoResponseEntity, SearchRequestEntity> {
  SearchPhotoRepository repository;

  SearchPhotosUseCase({required this.repository});

  @override
  Future<Either<Failure, PhotoResponseEntity>> call(SearchRequestEntity parameters) async {
    return await repository.getPhotos(parameters);
  }
}
