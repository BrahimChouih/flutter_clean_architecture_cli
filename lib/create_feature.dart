import 'dart:io';

import 'package:flutter_clean_architecture_cli/feature_template/data/datasource/base_template_remote_datasource.dart';
import 'package:flutter_clean_architecture_cli/feature_template/data/datasource/template_remote_datasource.dart';
import 'package:flutter_clean_architecture_cli/feature_template/data/models/template_model/template_model.dart';
import 'package:flutter_clean_architecture_cli/feature_template/data/repositories/template_repository.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/repositories/base_template_repository.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/usecases/create_template_usecase.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/usecases/get_template_details_usecase.dart';
import 'package:flutter_clean_architecture_cli/feature_template/domain/usecases/get_templates_usecase.dart';
import 'package:flutter_clean_architecture_cli/feature_template/presentation/providers/template_provider.dart';
import 'package:flutter_clean_architecture_cli/helpers/file_helper.dart';

class FlutterCleanArchitectureCLIFeature {
  static String featureName = '';
  static String featureDir = '';
  static String baseDir = '';

  static void createFeatureStructure(String featureName) {
    // Convert the feature name to lowercase for directory names
    FlutterCleanArchitectureCLIFeature.featureName = featureName;
    FlutterCleanArchitectureCLIFeature.featureDir = featureName.toLowerCase();

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

  static void createDataLayer() {
    final dataDir = Directory('$baseDir/data');
    dataDir.createSync(recursive: true);
    final layerDir = dataDir.path;

    final dataSourcesDir = Directory('$layerDir/datasources');
    final modelsDir = Directory('$layerDir/models');
    final repositoriesDataDir = Directory('$layerDir/repositories');

    dataSourcesDir.createSync(recursive: true);
    modelsDir.createSync(recursive: true);
    repositoriesDataDir.createSync(recursive: true);

    //// Data
    FileHelper.createFile(
      '${dataSourcesDir.path}/base_${featureDir}_remote_datasource.dart',
      baseDatasourcesTamplate(featureName),
    );
    FileHelper.createFile(
      '${dataSourcesDir.path}/${featureDir}_remote_datasource.dart',
      datasourcesTamplate(featureName),
    );
    FileHelper.createFile(
      '${modelsDir.path}/${featureDir}_model/${featureDir}_model.dart',
      modelTemplate(featureName),
    );
    FileHelper.createFile(
      '${repositoriesDataDir.path}/${featureDir}_repository.dart',
      repositoryDataTemplate(featureName),
    );
  }

  static void createDomainLayer() {
    final domainDir = Directory('$baseDir/domain');
    domainDir.createSync(recursive: true);
    final layerDir = domainDir.path;

    final repositoriesDomainDir = Directory('$layerDir/repositories');
    final usecasesDir = Directory('$layerDir/usecases');

    repositoriesDomainDir.createSync(recursive: true);
    usecasesDir.createSync(recursive: true);

    //// Domain
    FileHelper.createFile(
      '${repositoriesDomainDir.path}/base_${featureDir}_repository.dart',
      repositoryDomainTemplate(featureName),
    );
    FileHelper.createFile(
      '${usecasesDir.path}/create_${featureDir}_usecase.dart',
      createUseCaseTemplate(featureName),
    );
    FileHelper.createFile(
      '${usecasesDir.path}/get_${featureDir}_details_usecase.dart',
      getDetailsUseCaseTemplate(featureName),
    );
    FileHelper.createFile(
      '${usecasesDir.path}/get_${featureDir}s_usecase.dart',
      getUsecaseTemplate(featureName),
    );
  }

  static void createPresentationLayer() {
    final presentationDir = Directory('$baseDir/presentation');
    presentationDir.createSync(recursive: true);
    final layerDir = presentationDir.path;

    final providersDir = Directory('$layerDir/providers');

    providersDir.createSync(recursive: true);

    FileHelper.createFile(
      '${providersDir.path}/${featureDir}_provider.dart',
      providerTemplate(featureName),
    );
  }
}
