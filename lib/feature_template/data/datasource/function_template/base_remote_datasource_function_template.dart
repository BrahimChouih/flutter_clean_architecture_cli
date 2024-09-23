import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String baseDatasourcesFunctionTamplate(
  String featureName,
  String usecaseName,
) =>
    """
  Future<${usecaseName.moduleName}UsecaseOutput> ${usecaseName.camelCase}({
    required ${usecaseName.moduleName}UsecaseInput input,
  });
""";
