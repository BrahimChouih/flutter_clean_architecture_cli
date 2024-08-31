import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String datasourcesFunctionTamplate(
  String featureName,
  String usecaseName,
) =>
    """
  Future<${usecaseName.capitalize}UsecaseOutput> $usecaseName({
    required ${usecaseName.capitalize}UsecaseInput ${usecaseName}UsecaseInput,
  }) async {
    dynamic responceData = await APIHelper.post(
      endpoint: '\${APIConfigs.${featureName}s}/\$id',
      data: ${usecaseName}UsecaseInput.toJson(),
    );

    if (responceData != null) {
      return ${usecaseName.capitalize}UsecaseOutput.fromJson(responceData);
    } else {
      throw Failure.fromJson(responceData ?? {});
    }
  }
""";
