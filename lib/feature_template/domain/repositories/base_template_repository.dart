import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String repositoryDomainTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/failure/failure.dart';
import '../../domain/usecases/create_${featureName}_usecase.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '../../domain/usecases/get_${featureName}s_usecase.dart';

abstract class Base${featureName.moduleName}Repository {
  Future<Either<Failure, Get${featureName.moduleName}sUsecaseOutput>> get${featureName.moduleName}s({
    Get${featureName.moduleName}sUsecaseInput input =
        const Get${featureName.moduleName}sUsecaseInput(),
  });

  Future<Either<Failure, Get${featureName.moduleName}DetailsUsecaseOutput>> get${featureName.moduleName}({
    required Get${featureName.moduleName}DetailsUsecaseInput
        input,
  });

  Future<Either<Failure, Create${featureName.moduleName}UsecaseOutput?>> create${featureName.moduleName}({
    required Create${featureName.moduleName}UsecaseInput input,
    bool isUpdate = false,
  });
}
""";
