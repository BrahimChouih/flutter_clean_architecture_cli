import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String repositoryDomainTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/failure/failure.dart';
import '../../domain/usecases/create_${featureName}_usecase.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '../../domain/usecases/get_${featureName}s_usecase.dart';

abstract class Base${featureName.capitalize}Repository {
  Future<Either<Failure, Get${featureName.capitalize}sUsecaseOutput>> get${featureName.capitalize}s({
    Get${featureName.capitalize}sUsecaseInput input =
        const Get${featureName.capitalize}sUsecaseInput(),
  });

  Future<Either<Failure, Get${featureName.capitalize}DetailsUsecaseOutput>> get${featureName.capitalize}({
    required Get${featureName.capitalize}DetailsUsecaseInput
        input,
  });

  Future<Either<Failure, Create${featureName.capitalize}UsecaseOutput?>> create${featureName.capitalize}({
    required Create${featureName.capitalize}UsecaseInput input,
    bool isUpdate = false,
  });
}
""";
