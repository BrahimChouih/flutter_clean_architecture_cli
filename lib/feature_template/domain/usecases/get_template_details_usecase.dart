import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String getDetailsUseCaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '/core/failure/failure.dart';

class Get${featureName.moduleName}DetailsUsecase {
  final Base${featureName.moduleName}Repository repository;

  Get${featureName.moduleName}DetailsUsecase(this.repository);

  Future<Either<Failure, Get${featureName.moduleName}DetailsUsecaseOutput>> call({
    required Get${featureName.moduleName}DetailsUsecaseInput
        input,
  }) async {
    return await repository.get${featureName.moduleName}(
      input: input,
    );
  }
}

class Get${featureName.moduleName}DetailsUsecaseInput {
  final int? id;

  const Get${featureName.moduleName}DetailsUsecaseInput({
    this.id,
  });
}

class Get${featureName.moduleName}DetailsUsecaseOutput {
  final ${featureName.moduleName}Model data;

  const Get${featureName.moduleName}DetailsUsecaseOutput({required this.data});
}

""";
