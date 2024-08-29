#!/usr/bin/env dart

import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter_clean_architecture_cli/flutter_clean_architecture_cli_functions.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('feature', abbr: 'f', help: 'Name of the feature');

  final argResults = parser.parse(arguments);

  if (argResults.wasParsed('feature')) {
    final featureName = argResults['feature'];
    FlutterCleanArchitectureCLI.createFeatureStructure(featureName);
    _runPubget(true);
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
