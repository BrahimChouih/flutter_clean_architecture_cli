import 'package:flutter_clean_architecture_cli/extension.dart';

String createUseCaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '/core/failure/failure.dart';

class Create${featureName.capitalize}Usecase {
  final Base${featureName.capitalize}Repository repository;

  Create${featureName.capitalize}Usecase(this.repository);

  Future<Either<Failure, ${featureName.capitalize}Model?>> call({
    required ${featureName.capitalize}Model $featureName,
  }) async {
    return await repository.create${featureName.capitalize}(
      $featureName: $featureName,
    );
  }

  Future<Either<Failure, ${featureName.capitalize}Model?>> update({
    required ${featureName.capitalize}Model $featureName,
  }) async {
    return await repository.create${featureName.capitalize}(
      $featureName: $featureName,
      isUpdate: true,
    );
  }
}
""";
