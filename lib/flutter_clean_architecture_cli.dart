// library flutter_clean_architecture_cli;

// import 'package:args/args.dart';

// import 'create_feature.dart';

// void main(List<String> arguments) {
//   final parser = ArgParser()
//     ..addOption('feature', abbr: 'f', help: 'Name of the feature');

//   final argResults = parser.parse(arguments);

//   if (argResults.wasParsed('feature')) {
//     final featureName = argResults['feature'];
//     FlutterCleanArchitectureCLIFeature.createFeatureStructure(featureName);
//   } else {
//     print('Please provide a feature name using -f or --feature');
//   }
// }
