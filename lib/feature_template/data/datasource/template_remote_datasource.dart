import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String datasourcesTamplate(String featureName) => """
import '/core/configs/api_config.dart';
import '/core/failure/failure.dart';
import '/core/helpers/api_helper.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import 'base_${featureName}_datasource.dart';
import '../../domain/usecases/create_${featureName}_usecase.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '../../domain/usecases/get_${featureName}s_usecase.dart';

class ${featureName.moduleName}RemoteDataSource implements Base${featureName.moduleName}DataSource {
  @override
  Future<Create${featureName.moduleName}UsecaseOutput?> create${featureName.moduleName}({
    required Create${featureName.moduleName}UsecaseInput input,
    bool isUpdate = false,
  }) async {
    dynamic responceData;
    if (isUpdate) {
      responceData = await APIHelper.patch(
        endpoint: '\${APIConfigs.${featureName.camelCase}s}/\${input.model.id}',
        data: input.model.toJson(),
      );
    } else {
      responceData = await APIHelper.post(
        endpoint: APIConfigs.${featureName.camelCase}s,
        data: input.model.toJson(),
      );
    }
    return responceData == null
        ? null
        : Create${featureName.moduleName}UsecaseOutput(
            model: ${featureName.moduleName}Model.fromJson(responceData),
          );
  }

  @override
  Future<Get${featureName.moduleName}sUsecaseOutput> get${featureName.moduleName}s({
    Get${featureName.moduleName}sUsecaseInput input = const Get${featureName.moduleName}sUsecaseInput(),
  }) async {
    dynamic responceData = await APIHelper.get(
      endpoint: APIConfigs.${featureName.camelCase}s,
      queryParameters: {}..addAll(input.paginationOptions.toJson()),
    );

    if (responceData != null) {
      final List<${featureName.moduleName}Model> data = [];
      for (var element in (responceData as List)) {
        data.add(${featureName.moduleName}Model.fromJson(element));
      }
      return Get${featureName.moduleName}sUsecaseOutput(data: data);
    } else {
      throw Failure.fromJson(responceData ?? {});
    }
  }

  @override
  Future<Get${featureName.moduleName}DetailsUsecaseOutput> get${featureName.moduleName}({
    required Get${featureName.moduleName}DetailsUsecaseInput input,
  }) async {
    dynamic responceData = await APIHelper.get(
      endpoint: '\${APIConfigs.${featureName.camelCase}s}/\${input.id}',
    );

    if (responceData != null) {
      return Get${featureName.moduleName}DetailsUsecaseOutput(
        data: ${featureName.moduleName}Model.fromJson(responceData),
      );
    } else {
      throw Failure.fromJson(responceData ?? {});
    }
  }
}
""";
