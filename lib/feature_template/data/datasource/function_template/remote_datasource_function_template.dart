import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String datasourcesFunctionTamplate(
  String featureName,
  String usecaseName,
) =>
    """
  @override
  Future<${usecaseName.moduleName}UsecaseOutput> $usecaseName({
    required ${usecaseName.moduleName}UsecaseInput ${usecaseName}UsecaseInput,
  }) async {
    dynamic responceData = await APIHelper.post(
      endpoint: APIConfigs.${featureName}s,
      data: ${usecaseName}UsecaseInput.toJson(),
    );

    if (responceData != null) {
      return ${usecaseName.moduleName}UsecaseOutput.fromJson(responceData);
    } else {
      throw Failure.fromJson(responceData ?? {});
    }
  }
""";
