import 'package:flutter_clean_architecture_cli/extensions/extension.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/repositories/base_repository_fuction_template.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/usecases/usecase_tamplate.dart';
import 'package:flutter_clean_architecture_cli/helpers/file_helper.dart';

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
    // createDataLayer();

    //// Domain layer
    createDomainLayer();

    //// Presentation layer
    // createPresentationLayer();

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

    await FileHelper.addToTheEndOfClass(
      repositoriesDomainDir,
      repositoryFunctionDomainTemplate(featureName, usecaseName),
    );

    await FileHelper.addToTheBeginOfFile(
      repositoriesDomainDir,
      "import '../usecases/${usecaseName.snakeCase}_usecase.dart';",
    );
  }
}
