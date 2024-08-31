import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String createUseCaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '/core/failure/failure.dart';

class Create${featureName.moduleName}Usecase {
  final Base${featureName.moduleName}Repository repository;

  Create${featureName.moduleName}Usecase(this.repository);

  Future<Either<Failure, Create${featureName.moduleName}UsecaseOutput?>> call({
    required Create${featureName.moduleName}UsecaseInput input,
  }) async {
    return await repository.create${featureName.moduleName}(
      input: input,
    );
  }

  Future<Either<Failure, Create${featureName.moduleName}UsecaseOutput?>> update({
    required Create${featureName.moduleName}UsecaseInput input,
  }) async {
    return await repository.create${featureName.moduleName}(
      input: input,
      isUpdate: true,
    );
  }
}

class Create${featureName.moduleName}UsecaseInput {
  final ${featureName.moduleName}Model model;

  const Create${featureName.moduleName}UsecaseInput({
    required this.model,
  });
}

class Create${featureName.moduleName}UsecaseOutput {
  final ${featureName.moduleName}Model? model;

  const Create${featureName.moduleName}UsecaseOutput({this.model});
}
""";
