import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String repositoryFunctionDataTemplate(
  String featureName,
  String usecaseName,
) =>
    """
  @override
  Future<Either<Failure, ${usecaseName.moduleName}UsecaseOutput>> ${usecaseName.camelCase}({
    required ${usecaseName.moduleName}UsecaseInput input,
  }) async {
    try {
      return Right(
        await remoteDataSource.${usecaseName.camelCase}(
          input: input,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }
  """;
