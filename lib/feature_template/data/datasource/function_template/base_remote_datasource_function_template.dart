import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String baseDatasourcesFunctionTamplate(
  String featureName,
  String usecaseName,
) =>
    """
  Future<${usecaseName.moduleName}UsecaseOutput> $usecaseName({
    required ${usecaseName.moduleName}UsecaseInput ${usecaseName}UsecaseInput,
  });
""";
