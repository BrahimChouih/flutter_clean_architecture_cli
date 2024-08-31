import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String baseDatasourcesTamplate(String featureName) => """
import '../../domain/usecases/create_${featureName}_usecase.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '../../domain/usecases/get_${featureName}s_usecase.dart';

abstract class Base${featureName.moduleName}RemoteDataSource {
  Future<Get${featureName.moduleName}sUsecaseOutput> get${featureName.moduleName}s({
    Get${featureName.moduleName}sUsecaseInput input = const Get${featureName.moduleName}sUsecaseInput(),
  });

  Future<Get${featureName.moduleName}DetailsUsecaseOutput> get${featureName.moduleName}({
    required Get${featureName.moduleName}DetailsUsecaseInput input,
  });

  Future<Create${featureName.moduleName}UsecaseOutput?> create${featureName.moduleName}({
    required Create${featureName.moduleName}UsecaseInput input,
    bool isUpdate = false,
  });
}
""";
