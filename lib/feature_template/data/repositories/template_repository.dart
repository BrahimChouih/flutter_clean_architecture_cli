import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String repositoryDataTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/failure/failure.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';
import '../../domain/usecases/create_${featureName}_usecase.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '../../domain/usecases/get_${featureName}s_usecase.dart';

import '../datasources/base_${featureName}_remote_datasource.dart';

class ${featureName.capitalize}Repository implements Base${featureName.capitalize}Repository {
  final Base${featureName.capitalize}RemoteDataSource remoteDataSource;

  ${featureName.capitalize}Repository({required this.remoteDataSource});

  @override
  Future<Either<Failure, Create${featureName.capitalize}UsecaseOutput?>> create${featureName.capitalize}({
    required Create${featureName.capitalize}UsecaseInput input,
    bool isUpdate = false,
  }) async {
    try {
      return Right(
        await remoteDataSource.create${featureName.capitalize}(
          input: input,
          isUpdate: isUpdate,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Get${featureName.capitalize}sUsecaseOutput>> get${featureName.capitalize}s({
    Get${featureName.capitalize}sUsecaseInput input = const Get${featureName.capitalize}sUsecaseInput(),
  }) async {
    try {
      return Right(
        await remoteDataSource.get${featureName.capitalize}s(
          input: input,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Get${featureName.capitalize}DetailsUsecaseOutput>> get${featureName.capitalize}({
    required Get${featureName.capitalize}DetailsUsecaseInput input,
  }) async {
    try {
      return Right(
        await remoteDataSource.get${featureName.capitalize}(
          input: input,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }
}


""";
