import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String getDetailsUseCaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '/core/failure/failure.dart';

class Get${featureName.capitalize}DetailsUsecase {
  final Base${featureName.capitalize}Repository repository;

  Get${featureName.capitalize}DetailsUsecase(this.repository);

  Future<Either<Failure, Get${featureName.capitalize}DetailsUsecaseOutput>> call({
    required Get${featureName.capitalize}DetailsUsecaseInput
        input,
  }) async {
    return await repository.get${featureName.capitalize}(
      input: input,
    );
  }
}

class Get${featureName.capitalize}DetailsUsecaseInput {
  final int? id;

  const Get${featureName.capitalize}DetailsUsecaseInput({
    this.id,
  });
}

class Get${featureName.capitalize}DetailsUsecaseOutput {
  final ${featureName.capitalize}Model data;

  const Get${featureName.capitalize}DetailsUsecaseOutput({required this.data});
}

""";
