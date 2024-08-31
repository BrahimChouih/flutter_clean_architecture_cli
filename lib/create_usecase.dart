import 'package:flutter_clean_architecture_cli/extensions/extension.dart';
import 'package:flutter_clean_architecture_cli/feature_template/data/datasource/function_template/base_remote_datasource_function_template.dart';
import 'package:flutter_clean_architecture_cli/feature_template/data/datasource/function_template/remote_datasource_function_template.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/repositories/base_repository_fuction_template.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/usecases/usecase_tamplate.dart';
import 'package:flutter_clean_architecture_cli/feature_template/presentation/providers/provider_function_template.dart';
import 'package:flutter_clean_architecture_cli/helpers/file_helper.dart';

import 'feature_template/data/repositories/repository_fuction_template.dart';

class FlutterCleanArchitectureCLIUseCase {
  static String featureName = '';
  static String featureDir = '';
  static String baseDir = '';
  static String usecaseName = '';

  static void createUsecase(String featureName, String usecaseName) {
    // Convert the feature name to lowercase for directory names
    FlutterCleanArchitectureCLIUseCase.usecaseName = usecaseName;
    FlutterCleanArchitectureCLIUseCase.featureName = featureName;
    FlutterCleanArchitectureCLIUseCase.featureDir = featureName.toLowerCase();

    // Define the base paths for each layer
    baseDir = 'lib/features/$featureDir';

    //// Data layer
    createDataLayer();

    //// Domain layer
    createDomainLayer();

    //// Presentation layer
    createPresentationLayer();

    print('Feature "$featureName" structure created successfully.');
  }

  static void createDomainLayer() async {
    final layerDir = '$baseDir/domain';

    final repositoriesDomainDir =
        '$layerDir/repositories/base_${featureDir}_repository.dart';
    final usecasesDir =
        '$layerDir/usecases/${usecaseName.snakeCase}_usecase.dart';

    FileHelper.createFile(
      usecasesDir,
      usecaseTemplate(featureName, usecaseName),
    );

    await FileHelper.addToTheClass(
      repositoriesDomainDir,
      endOfClass: repositoryFunctionDomainTemplate(featureName, usecaseName),
      importContent:
          "import '../usecases/${usecaseName.snakeCase}_usecase.dart';",
    );
  }

  static void createDataLayer() async {
    final layerDir = '$baseDir/data';

    final repositoriesDomainDir =
        '$layerDir/repositories/${featureDir}_repository.dart';

    final baseDatasourceDir =
        '$layerDir/datasources/base_${featureDir}_remote_datasource.dart';

    final datasourceDir =
        '$layerDir/datasources/${featureDir}_remote_datasource.dart';

    await FileHelper.addToTheClass(
      repositoriesDomainDir,
      endOfClass: repositoryFunctionDataTemplate(featureName, usecaseName),
      importContent:
          "import '../../domain/usecases/${usecaseName.snakeCase}_usecase.dart';",
    );

    await FileHelper.addToTheClass(
      baseDatasourceDir,
      endOfClass: baseDatasourcesFunctionTamplate(featureName, usecaseName),
      importContent:
          "import '../../domain/usecases/${usecaseName.snakeCase}_usecase.dart';",
    );

    await FileHelper.addToTheClass(
      datasourceDir,
      endOfClass: datasourcesFunctionTamplate(featureName, usecaseName),
      importContent:
          "import '../../domain/usecases/${usecaseName.snakeCase}_usecase.dart';",
    );
  }

  static void createPresentationLayer() async {
    final layerDir = '$baseDir/presentation';

    final providerDir = '$layerDir/providers/${featureDir}_provider.dart';

    await FileHelper.addToTheClass(
      providerDir,
      biginOfClass:
          'final ${usecaseName.capitalize}Usecase ${usecaseName}Usecase;',
      endOfClass: providerFunctionTamplate(featureName, usecaseName),
      importContent:
          "import '../../domain/usecases/${usecaseName.snakeCase}_usecase.dart';",
    );
  }
}
