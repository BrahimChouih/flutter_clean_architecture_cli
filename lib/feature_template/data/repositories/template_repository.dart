import 'package:flutter_clean_architecture_cli/extension.dart';

String repositoryDataTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/failure/failure.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '../datasource/${featureName}_remote_datasource.dart';

class ${featureName.capitalize}Repository implements Base${featureName.capitalize}Repository {
  final Base${featureName.capitalize}RemoteDataSource remoteDataSource;

  ${featureName.capitalize}Repository({required this.remoteDataSource});

  @override
  Future<Either<Failure, ${featureName.capitalize}Model?>> create${featureName.capitalize}({
    required ${featureName.capitalize}Model $featureName,
    bool isUpdate = false,
  }) async {
    try {
      return Right(
        await remoteDataSource.create${featureName.capitalize}(
          $featureName: $featureName,
          isUpdate: isUpdate,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<${featureName.capitalize}Model>>> get${featureName.capitalize}s({
    PaginationOptions paginationOptions = const PaginationOptions(),
  }) async {
    try {
      return Right(
        await remoteDataSource.get${featureName.capitalize}s(
          paginationOptions: paginationOptions,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, ${featureName.capitalize}Model?>> get${featureName.capitalize}({required int id}) async {
    try {
      return Right(
        await remoteDataSource.get${featureName.capitalize}(
          id: id,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
""";
