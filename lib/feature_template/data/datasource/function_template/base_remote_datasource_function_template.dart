import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String baseDatasourcesFunctionTamplate(
  String featureName,
  String usecaseName,
) =>
    """
  Future<${usecaseName.capitalize}UsecaseOutput> $usecaseName({
    required ${usecaseName.capitalize}UsecaseInput ${usecaseName}UsecaseInput,
  });
""";
