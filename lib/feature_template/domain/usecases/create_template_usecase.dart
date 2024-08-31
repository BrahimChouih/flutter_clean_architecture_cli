import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String createUseCaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '/core/failure/failure.dart';

class Create${featureName.capitalize}Usecase {
  final Base${featureName.capitalize}Repository repository;

  Create${featureName.capitalize}Usecase(this.repository);

  Future<Either<Failure, Create${featureName.capitalize}UsecaseOutput?>> call({
    required Create${featureName.capitalize}UsecaseInput input,
  }) async {
    return await repository.create${featureName.capitalize}(
      input: input,
    );
  }

  Future<Either<Failure, Create${featureName.capitalize}UsecaseOutput?>> update({
    required Create${featureName.capitalize}UsecaseInput input,
  }) async {
    return await repository.create${featureName.capitalize}(
      input: input,
      isUpdate: true,
    );
  }
}

class Create${featureName.capitalize}UsecaseInput {
  final ${featureName.capitalize}Model model;

  const Create${featureName.capitalize}UsecaseInput({
    required this.model,
  });
}

class Create${featureName.capitalize}UsecaseOutput {
  final ${featureName.capitalize}Model? model;

  const Create${featureName.capitalize}UsecaseOutput({this.model});
}
""";
