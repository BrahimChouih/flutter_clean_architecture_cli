import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String providerTemplate(String featureName) => """
import '/core/failure/failure.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '/core/provider_template/provider_template.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/usecases/create_${featureName}_usecase.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '../../domain/usecases/get_${featureName}s_usecase.dart';

class ${featureName.moduleName}Provider extends ProviderTemplate {
  final Get${featureName.moduleName}sUsecase get${featureName.moduleName}sUsecase;
  final Get${featureName.moduleName}DetailsUsecase get${featureName.moduleName}DetailsUsecase;
  final Create${featureName.moduleName}Usecase create${featureName.moduleName}Usecase;

  ${featureName.moduleName}Provider({
    required this.get${featureName.moduleName}sUsecase,
    required this.get${featureName.moduleName}DetailsUsecase,
    required this.create${featureName.moduleName}Usecase,
  });

  PaginationController<${featureName.moduleName}Model> ${featureName}s =
      PaginationController<${featureName.moduleName}Model>();

  Future<void> reinit() async {
    await Future.wait([
      get${featureName.moduleName}s(reinit: true),
    ]);
  }

  Future<void> get${featureName.moduleName}s({
    bool reinit = false,
    Function()? onSuccess,
    Function(Failure)? onError,
  }) async {
    changeLoadingState(true);
    PaginationController<${featureName.moduleName}Model> controller = ${featureName}s;

    (await get${featureName.moduleName}sUsecase(
      input: Get${featureName.moduleName}sUsecaseInput(
        paginationOptions: controller.paginationOptions,
      ),
    ))
        .fold(
      (l) {
        if (onError != null) onError(l);
        // showError(l);
      },
      (r) {
        if (reinit) controller.emptyData();
        controller.updateDataByPage(data: r.data);
        if (onSuccess != null) onSuccess();
      },
    );
    changeLoadingState(false);
  }

  Future<void> get${featureName.moduleName}Details({
    required int id,
    Function(${featureName.moduleName}Model)? onSuccess,
    Function(Failure)? onError,
  }) async {
    changeLoadingState(true);

    (await get${featureName.moduleName}DetailsUsecase(
      input: Get${featureName.moduleName}DetailsUsecaseInput(
        id: id,
      ),
    ))
        .fold(
      (l) {
        if (onError != null) onError(l);
        // showError(l);
      },
      (r) {
        if (onSuccess != null) onSuccess(r.data);
      },
    );
    changeLoadingState(false);
  }

  Future<void> create${featureName.moduleName}({
    required ${featureName.moduleName}Model $featureName,
    Function()? onSuccess,
    Function(Failure)? onError,
  }) async {
    changeLoadingState(true);
    (await create${featureName.moduleName}Usecase(
      input: Create${featureName.moduleName}UsecaseInput(
        model: $featureName,
      ),
    ))
        .fold(
      (l) {
        if (onError != null) onError(l);
        showError(l);
      },
      (r) async {
        await get${featureName.moduleName}s();
        if (onSuccess != null) onSuccess();
      },
    );
    changeLoadingState(false);
  }

  Future<void> update${featureName.moduleName}({
    required ${featureName.moduleName}Model $featureName,
    Function()? onSuccess,
    Function(Failure)? onError,
  }) async {
    changeLoadingState(true);
    (await create${featureName.moduleName}Usecase.update(
      input: Create${featureName.moduleName}UsecaseInput(
        model: $featureName,
      ),
    ))
        .fold(
      (l) {
        if (onError != null) onError(l);
        showError(l);
      },
      (r) async {
        await get${featureName.moduleName}s();
        if (onSuccess != null) onSuccess();
      },
    );
    changeLoadingState(false);
  }
}
""";
