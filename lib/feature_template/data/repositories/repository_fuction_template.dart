import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String repositoryFunctionDataTemplate(
  String featureName,
  String usecaseName,
) =>
    """
  @override
  Future<Either<Failure, ${usecaseName.moduleName}UsecaseOutput>> $usecaseName({
    required ${usecaseName.moduleName}UsecaseInput ${usecaseName}UsecaseInput,
  }) async {
    try {
      return Right(
        await remoteDataSource.$usecaseName(
          ${usecaseName}UsecaseInput: ${usecaseName}UsecaseInput,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }
  """;
