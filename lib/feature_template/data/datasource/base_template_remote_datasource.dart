import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String baseDatasourcesTamplate(String featureName) => """
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/usecases/create_${featureName}_usecase.dart';
import '../../domain/usecases/get_${featureName}_details_usecase.dart';
import '../../domain/usecases/get_${featureName}s_usecase.dart';

abstract class Base${featureName.capitalize}RemoteDataSource {
  Future<Get${featureName.capitalize}sUsecaseOutput> get${featureName.capitalize}s({
    Get${featureName.capitalize}sUsecaseInput input = const Get${featureName.capitalize}sUsecaseInput(),
  });

  Future<Get${featureName.capitalize}DetailsUsecaseOutput> get${featureName.capitalize}({
    required Get${featureName.capitalize}DetailsUsecaseInput input,
  });

  Future<Create${featureName.capitalize}UsecaseOutput?> create${featureName.capitalize}({
    required Create${featureName.capitalize}UsecaseInput input,
    bool isUpdate = false,
  });
}
""";
