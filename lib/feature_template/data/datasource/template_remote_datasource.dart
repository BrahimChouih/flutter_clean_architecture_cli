import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String datasourcesTamplate(String featureName) => """
import '/core/configs/api_config.dart';
import '/core/failure/failure.dart';
import '/core/helpers/api_helper.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import 'base_${featureName}_remote_datasource.dart';
import '../../domain/usecases/create_${featureName}_usecase.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '../../domain/usecases/get_${featureName}s_usecase.dart';

class ${featureName.capitalize}RemoteDataSource implements Base${featureName.capitalize}RemoteDataSource {
  @override
  Future<Create${featureName.capitalize}UsecaseOutput?> create${featureName.capitalize}({
    required Create${featureName.capitalize}UsecaseInput input,
    bool isUpdate = false,
  }) async {
    dynamic responceData;
    if (isUpdate) {
      responceData = await APIHelper.post(
        endpoint: '\${APIConfigs.transactions}/\${input.model.id}',
        data: input.model.toJson(),
      );
    } else {
      responceData = await APIHelper.post(
        endpoint: APIConfigs.transactions,
        data: input.model.toJson(),
      );
    }
    return responceData == null
        ? null
        : Create${featureName.capitalize}UsecaseOutput(
            model: ${featureName.capitalize}Model.fromJson(responceData),
          );
  }

  @override
  Future<Get${featureName.capitalize}sUsecaseOutput> get${featureName.capitalize}s({
    Get${featureName.capitalize}sUsecaseInput input = const Get${featureName.capitalize}sUsecaseInput(),
  }) async {
    dynamic responceData = await APIHelper.get(
      endpoint: APIConfigs.transactions,
      queryParameters: {}..addAll(input.paginationOptions.toJson()),
    );

    if (responceData != null) {
      final List<${featureName.capitalize}Model> data = [];
      for (var element in (responceData as List)) {
        data.add(${featureName.capitalize}Model.fromJson(element));
      }
      return Get${featureName.capitalize}sUsecaseOutput(data: data);
    } else {
      throw Failure.fromJson(responceData ?? {});
    }
  }

  @override
  Future<Get${featureName.capitalize}DetailsUsecaseOutput> get${featureName.capitalize}({
    required Get${featureName.capitalize}DetailsUsecaseInput input,
  }) async {
    dynamic responceData = await APIHelper.get(
      endpoint: '\${APIConfigs.transactions}/\${input.id}',
    );

    if (responceData != null) {
      return Get${featureName.capitalize}DetailsUsecaseOutput(
        data: ${featureName.capitalize}Model.fromJson(responceData),
      );
    } else {
      throw Failure.fromJson(responceData ?? {});
    }
  }
}
""";
