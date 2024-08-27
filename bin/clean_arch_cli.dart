#!/usr/bin/env dart

import 'package:args/args.dart';
import 'package:flutter_clean_architecture_cli/flutter_clean_architecture_cli_functions.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('feature', abbr: 'f', help: 'Name of the feature');

  final argResults = parser.parse(arguments);

  if (argResults.wasParsed('feature')) {
    final featureName = argResults['feature'];
    FlutterCleanArchitectureCLI.createFeatureStructure(featureName);
  } else {
    print('Please provide a feature name using -f or --feature');
  }
}
