import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String datasourcesTamplate(String featureName) => """
import '/core/configs/api_config.dart';
import '/core/failure/failure.dart';
import '/core/helpers/api_helper.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import 'base_${featureName}_remote_datasource.dart';

class ${featureName.capitalize}RemoteDataSource implements Base${featureName.capitalize}RemoteDataSource {
  @override
  Future<${featureName.capitalize}Model?> create${featureName.capitalize}({
    required ${featureName.capitalize}Model $featureName,
    bool isUpdate = false,
  }) async {
    dynamic responceData;
    if (isUpdate) {
      responceData = await APIHelper.post(
        endpoint: '\${APIConfigs.${featureName}s}/\${$featureName.id}',
        data: $featureName.toJson(),
      );
    } else {
      responceData = await APIHelper.post(
        endpoint: APIConfigs.${featureName}s,
        data: $featureName.toJson(),
      );
    }
    return responceData == null ? null : ${featureName.capitalize}Model.fromJson(responceData);
  }

  @override
  Future<List<${featureName.capitalize}Model>> get${featureName.capitalize}s({
    PaginationOptions paginationOptions = const PaginationOptions(),
  }) async {
    dynamic responceData = await APIHelper.get(
      endpoint: APIConfigs.${featureName}s,
      queryParameters: {}..addAll(paginationOptions.toJson()),
    );

    if (responceData != null) {
      final List<${featureName.capitalize}Model> data = [];
      for (var element in (responceData as List)) {
        data.add(${featureName.capitalize}Model.fromJson(element));
      }
      return data;
    } else {
      throw Failure.fromJson(responceData ?? {});
    }
  }

  @override
  Future<${featureName.capitalize}Model> get${featureName.capitalize}({
    required int id,
  }) async {
    dynamic responceData = await APIHelper.get(
      endpoint: '\${APIConfigs.${featureName}s}/\$id',
    );

    if (responceData != null) {
      return ${featureName.capitalize}Model.fromJson(responceData);
    } else {
      throw Failure.fromJson(responceData ?? {});
    }
  }
}
""";
