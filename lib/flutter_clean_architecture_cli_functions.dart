import 'dart:io';

import 'package:flutter_clean_architecture_cli/feature_template/data/datasource/template_remote_datasource.dart';
import 'package:flutter_clean_architecture_cli/feature_template/data/models/template_model/template_model.dart';
import 'package:flutter_clean_architecture_cli/feature_template/data/repositories/template_repository.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/repositories/base_template_repository.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/usecases/create_template_usecase.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/usecases/get_template_details_usecase.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/usecases/get_templates_usecase.dart';

class FlutterCleanArchitectureCLI {
  static void createFeatureStructure(String featureName) {
    // Convert the feature name to lowercase for directory names
    final featureDir = featureName.toLowerCase();

    // Define the base paths for each layer
    final baseDir = Directory('lib/features/$featureDir');
    final dataDir = Directory('${baseDir.path}/data');
    final domainDir = Directory('${baseDir.path}/domain');

    //// data layer
    final dataSourcesDir = Directory('${dataDir.path}/datasources');
    final modelsDir = Directory('${dataDir.path}/models');
    final repositoriesDataDir = Directory('${dataDir.path}/repositories');

    //// domain layer
    final repositoriesDomainDir = Directory('${domainDir.path}/repositories');
    final usecasesDir = Directory('${domainDir.path}/usecases');

    // Create the directories
    dataDir.createSync(recursive: true);
    domainDir.createSync(recursive: true);

    dataSourcesDir.createSync(recursive: true);
    modelsDir.createSync(recursive: true);
    repositoriesDataDir.createSync(recursive: true);

    repositoriesDomainDir.createSync(recursive: true);
    usecasesDir.createSync(recursive: true);

    // Create the files with basic content
    //// Data
    createFile(
      '${dataSourcesDir.path}/${featureDir}_remote_datasource.dart',
      datasourcesTamplate(featureName),
    );
    createFile(
      '${modelsDir.path}/${featureDir}_model/${featureDir}_model.dart',
      modelTemplate(featureName),
    );
    createFile(
      '${repositoriesDataDir.path}/${featureDir}_repository.dart',
      repositoryDataTemplate(featureName),
    );
    //// Domain
    createFile(
      '${repositoriesDomainDir.path}/${featureDir}_repository.dart',
      repositoryDomainTemplate(featureName),
    );
    createFile(
      '${usecasesDir.path}/create_${featureDir}_usecase.dart',
      createUseCaseTemplate(featureName),
    );
    createFile(
      '${usecasesDir.path}/get_${featureDir}_details_usecase.dart',
      getDetailsUseCaseTemplate(featureName),
    );
    createFile(
      '${usecasesDir.path}/get_${featureDir}s_usecase.dart',
      getUsecaseTemplate(featureName),
    );

    print('Feature "$featureName" structure created successfully.');
  }

  static void createFile(String path, String content) {
    final file = File(path);
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
  }
}
