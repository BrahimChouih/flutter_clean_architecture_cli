import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String providerFunctionTamplate(
  String featureName,
  String usecaseName,
) =>
    """
  Future<void> $usecaseName({
    required ${usecaseName.capitalize}UsecaseInput ${usecaseName}UsecaseInput,
    Function()? onSuccess,
    Function(Failure)? onError,
  }) async {
    changeLoadingState(true);

    (await ${usecaseName}Usecase(
      ${usecaseName}UsecaseInput: ${usecaseName}UsecaseInput,
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