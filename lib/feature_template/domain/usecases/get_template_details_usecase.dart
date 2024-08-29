import 'package:flutter_clean_architecture_cli/extension.dart';

String getDetailsUseCaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '/core/failure/failure.dart';

class Get${featureName.capitalize}DetailsUsecase {
  final Base${featureName.capitalize}Repository repository;

  Get${featureName.capitalize}DetailsUsecase(this.repository);

  Future<Either<Failure, ${featureName.capitalize}Model>> call({
    required int id,
  }) async {
    return await repository.get${featureName.capitalize}(
      id: id,
    );
  }
}
""";
