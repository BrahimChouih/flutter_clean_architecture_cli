import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String repositoryFunctionDomainTemplate(
  String featureName,
  String usecaseName,
) =>
    """
  Future<Either<Failure, ${usecaseName.moduleName}UsecaseOutput>> ${usecaseName.camelCase}({
    required ${usecaseName.moduleName}UsecaseInput input,
  });
""";
