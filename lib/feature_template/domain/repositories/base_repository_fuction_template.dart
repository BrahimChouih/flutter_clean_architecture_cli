import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String repositoryFunctionDomainTemplate(
  String featureName,
  String usecaseName,
) =>
    """
  Future<Either<Failure, ${usecaseName.capitalize}UsecaseOutput>> get${featureName.capitalize}({
    required ${usecaseName.capitalize}UsecaseInput ${usecaseName}UsecaseInput,
  });
""";
