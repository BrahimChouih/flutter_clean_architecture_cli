import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String repositoryFunctionDomainTemplate(
  String featureName,
  String usecaseName,
) =>
    """
  Future<Either<Failure, ${usecaseName.capitalize}UsecaseOutput>> $usecaseName({
    required ${usecaseName.capitalize}UsecaseInput ${usecaseName}UsecaseInput,
  });
""";
