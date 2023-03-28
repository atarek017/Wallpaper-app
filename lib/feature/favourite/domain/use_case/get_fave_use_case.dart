import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../home/domain/entity/response_entity/photo_response.dart';
import '../repository/fave_repository.dart';

class GetFaveImageUseCase extends BaseUseCase<List<PhotoEntity>, NoParameters> {
  FaveRepository repository;

  GetFaveImageUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PhotoEntity>>> call(
      NoParameters parameters) async {
    return await repository.getFaveImages();
  }
}
