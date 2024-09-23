import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String providerFunctionTamplate(
  String featureName,
  String usecaseName,
) =>
    """
  Future<void> ${usecaseName.camelCase}({
    required ${usecaseName.moduleName}UsecaseInput input,
    Function()? onSuccess,
    Function(Failure)? onError,
  }) async {
    changeLoadingState(true);

    (await ${usecaseName.moduleName}Usecase(
      input: input,
    ))
        .fold(
      (l) {
        if (onError != null) onError(l);
        // showError(l);
      },
      (r) {

        if (onSuccess != null) onSuccess();
      },
    );
    changeLoadingState(false);
  }
""";
