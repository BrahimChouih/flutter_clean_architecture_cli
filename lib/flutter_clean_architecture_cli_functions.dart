import 'dart:io';

class FlutterCleanArchitectureCLI {
  static void createFeatureStructure(String featureName) {
    // Convert the feature name to lowercase for directory names
    final featureDir = featureName.toLowerCase();

    // Define the base paths for each layer
    final baseDir = Directory('lib/features/$featureDir');
    final dataDir = Directory('${baseDir.path}/data');
    final domainDir = Directory('${baseDir.path}/domain');
    final presentationDir = Directory('${baseDir.path}/presentation');

    // Create the directories
    dataDir.createSync(recursive: true);
    domainDir.createSync(recursive: true);
    presentationDir.createSync(recursive: true);

    // Create the files with basic content
    createFile(
      '${dataDir.path}/repositories/${featureDir}_repository.dart',
      'abstract class ${featureName.capitalize()}Repository {}',
    );
    createFile(
      '${domainDir.path}/entities/$featureDir.dart',
      'class ${featureName.capitalize()} {}',
    );
    createFile(
      '${domainDir.path}/usecases/${featureDir}_usecase.dart',
      'class ${featureName.capitalize()}UseCase {}',
    );
    createFile(
      '${presentationDir.path}/widgets/${featureDir}_widget.dart',
      'import \'package:flutter/material.dart\';\n\nclass ${featureName.capitalize()}Widget extends StatelessWidget {\n  @override\n  Widget build(BuildContext context) {\n    return Container();\n  }\n}',
    );

    print('Feature "$featureName" structure created successfully.');
  }

  static void createFile(String path, String content) {
    final file = File(path);
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
  }
}

extension StringCasingExtension on String {
  String capitalize() => this[0].toUpperCase() + substring(1);
}
