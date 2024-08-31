import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String baseDatasourcesTamplate(String featureName) => """
import '/core/pagination_controller/pagination_controller.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';

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
""";