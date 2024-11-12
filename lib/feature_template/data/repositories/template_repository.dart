import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String repositoryDataTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/failure/failure.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';
import '../../domain/usecases/create_${featureName}_usecase.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '../../domain/usecases/get_${featureName}s_usecase.dart';

import '../datasources/base_${featureName}_datasource.dart';

class ${featureName.moduleName}Repository implements Base${featureName.moduleName}Repository {
  final Base${featureName.moduleName}DataSource remoteDataSource;

  ${featureName.moduleName}Repository({required this.remoteDataSource});

  @override
  Future<Either<Failure, Create${featureName.moduleName}UsecaseOutput?>> create${featureName.moduleName}({
    required Create${featureName.moduleName}UsecaseInput input,
    bool isUpdate = false,
  }) async {
    try {
      return Right(
        await remoteDataSource.create${featureName.moduleName}(
          input: input,
          isUpdate: isUpdate,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Get${featureName.moduleName}sUsecaseOutput>> get${featureName.moduleName}s({
    Get${featureName.moduleName}sUsecaseInput input = const Get${featureName.moduleName}sUsecaseInput(),
  }) async {
    try {
      return Right(
        await remoteDataSource.get${featureName.moduleName}s(
          input: input,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Get${featureName.moduleName}DetailsUsecaseOutput>> get${featureName.moduleName}({
    required Get${featureName.moduleName}DetailsUsecaseInput input,
  }) async {
    try {
      return Right(
        await remoteDataSource.get${featureName.moduleName}(
          input: input,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }
}


""";
