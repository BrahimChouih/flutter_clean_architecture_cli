import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String getUsecaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '/core/failure/failure.dart';

class Get${featureName.moduleName}sUsecase {
  final Base${featureName.moduleName}Repository repository;

  Get${featureName.moduleName}sUsecase(this.repository);

  Future<Either<Failure, Get${featureName.moduleName}sUsecaseOutput>> call({
    Get${featureName.moduleName}sUsecaseInput input =
        const Get${featureName.moduleName}sUsecaseInput(),
  }) async {
    return await repository.get${featureName.moduleName}s(
      input: input,
    );
  }
}

class Get${featureName.moduleName}sUsecaseInput {
  final PaginationOptions paginationOptions;

  const Get${featureName.moduleName}sUsecaseInput({
    this.paginationOptions = const PaginationOptions(),
  });
}

class Get${featureName.moduleName}sUsecaseOutput {
  final List<${featureName.moduleName}Model> data;

  const Get${featureName.moduleName}sUsecaseOutput({this.data = const []});
}
""";
