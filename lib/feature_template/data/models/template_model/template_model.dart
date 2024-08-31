import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String modelTemplate(String featureName) => """
import 'package:freezed_annotation/freezed_annotation.dart';

part '${featureName}_model.freezed.dart';
part '${featureName}_model.g.dart';

@freezed
class ${featureName.moduleName}Model with _\$${featureName.moduleName}Model {
  const ${featureName.moduleName}Model._();

  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  factory ${featureName.moduleName}Model({
    int? id,
  }) = _${featureName.moduleName}Model;

  factory ${featureName.moduleName}Model.fromJson(Map<String, dynamic> json) =>
      _\$${featureName.moduleName}ModelFromJson(json);
}
""";
