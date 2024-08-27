import 'package:flutter_clean_architecture_cli/extension.dart';

String providerTemplate(String featureName) => """
import '/core/failure/failure.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '/core/provider_template/provider_template.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/usecases/create_${featureName}_usecase.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '../../domain/usecases/get_${featureName}s_usecase.dart';

class ${featureName.capitalize}Provider extends ProviderTemplate {
  final Get${featureName.capitalize}sUsecase get${featureName.capitalize}sUsecase;
  final Get${featureName.capitalize}DetailsUsecase get${featureName.capitalize}DetailsUsecase;
  final Create${featureName.capitalize}Usecase create${featureName.capitalize}Usecase;

  ${featureName.capitalize}Provider({
    required this.get${featureName.capitalize}sUsecase,
    required this.get${featureName.capitalize}DetailsUsecase,
    required this.create${featureName.capitalize}Usecase,
  });

  PaginationController<${featureName.capitalize}Model> ${featureName}s = PaginationController<${featureName.capitalize}Model>();

  Future<void> reinit() async {
    await Future.wait([
      get${featureName.capitalize}s(reinit: true),
    ]);
  }

  Future<void> get${featureName.capitalize}s({
    bool reinit = false,
    Function()? onSuccess,
    Function(Failure)? onError,
  }) async {
    changeLoadingState(true);
    PaginationController<${featureName.capitalize}Model> controller = ${featureName}s;

    (await get${featureName.capitalize}sUsecase(
      paginationOptions: controller.paginationOptions,
    ))
        .fold(
      (l) {
        if (onError != null) onError(l);
        // showError(l);
      },
      (r) {
        if (reinit) controller.emptyData();
        controller.updateDataByPage(data: r);
        if (onSuccess != null) onSuccess();
      },
    );
    changeLoadingState(false);
  }

  Future<void> create${featureName.capitalize}({
    required ${featureName.capitalize}Model $featureName,
    Function()? onSuccess,
    Function(Failure)? onError,
  }) async {
    changeLoadingState(true);
    (await create${featureName.capitalize}Usecase($featureName: $featureName)).fold(
      (l) {
        if (onError != null) onError(l);
        showError(l);
      },
      (r) async {
        await get${featureName.capitalize}s();
        if (onSuccess != null) onSuccess();
      },
    );
    changeLoadingState(false);
  }

  Future<void> update${featureName.capitalize}({
    required ${featureName.capitalize}Model $featureName,
    Function()? onSuccess,
    Function(Failure)? onError,
  }) async {
    changeLoadingState(true);
    (await create${featureName.capitalize}Usecase.update($featureName: $featureName)).fold(
      (l) {
        if (onError != null) onError(l);
        showError(l);
      },
      (r) async {
        await get${featureName.capitalize}s();
        if (onSuccess != null) onSuccess();
      },
    );
    changeLoadingState(false);
  }
}
""";
