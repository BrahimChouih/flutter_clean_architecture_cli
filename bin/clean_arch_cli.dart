#!/usr/bin/env dart

import 'dart:io';
import 'package:flutter_clean_architecture_cli/create_feature.dart';
import 'package:flutter_clean_architecture_cli/create_usecase.dart';

void main(List<String> arguments) {
  final String functionName = arguments.first;

  /// -feature or -usecase

  if (functionName == '-feature') {
    final featureName = arguments[1];
    FlutterCleanArchitectureCLIFeature.createFeatureStructure(featureName);
    _runPubget(true);
  } else if (functionName == '-usecase') {
    final featureName = arguments[2];
    final usecaseName = arguments[1];
    FlutterCleanArchitectureCLIUseCase.createUsecase(featureName, usecaseName);
  } else {
    print('Please provide a feature name using -f or --feature');
  }
}

Future _runPubget(bool fvm) async {
  print('\x1B[32mFiles generated successfully\x1B[0m');

  print(
      "running fvm flutter pub run build_runner build --delete-conflicting-outputs ");

  await Process.run(
    fvm ? 'fvm' : 'flutter',
    [
      if (fvm) 'flutter',
      'pub',
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ],
    runInShell: true,
  );
}
