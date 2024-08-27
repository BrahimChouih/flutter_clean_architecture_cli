import 'package:flutter_clean_architecture_cli/flutter_clean_architecture_cli_functions.dart';

String datasourcesTamplate(String featureName) => """
import '/core/configs/api_config.dart';
import '/core/failure/failure.dart';
import '/core/helpers/api_helper.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '/features/$featureName/data/models/${featureName}_model/${featureName}_model.dart';

abstract class Base${featureName.capitalize}RemoteDataSource {
  Future<List<${featureName.capitalize}Model>> get${featureName.capitalize}s({
    PaginationOptions paginationOptions = const PaginationOptions(),
  });

  Future<${featureName.capitalize}Model> get${featureName.capitalize}({
    required int id,
  });

  Future<${featureName.capitalize}Model?> create${featureName.capitalize}({
    required ${featureName.capitalize}Model $featureName,
    bool isUpdate = false,
  });
}

class ${featureName.capitalize}RemoteDataSource implements Base${featureName.capitalize}RemoteDataSource {
  @override
  Future<${featureName.capitalize}Model?> create${featureName.capitalize}({
    required ${featureName.capitalize}Model $featureName,
    bool isUpdate = false,
  }) async {
    Map<String, dynamic>? responceData;
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
    Map<String, dynamic>? responceData = await APIHelper.get(
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
    Map<String, dynamic>? responceData = await APIHelper.get(
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
