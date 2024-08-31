import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String modelTemplate(String featureName) => """
import 'package:freezed_annotation/freezed_annotation.dart';

part '${featureName}_model.freezed.dart';
part '${featureName}_model.g.dart';

@freezed
class ${featureName.capitalize}Model with _\$${featureName.capitalize}Model {
  const ${featureName.capitalize}Model._();

  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  factory ${featureName.capitalize}Model({
    int? id,
  }) = _${featureName.capitalize}Model;

  factory ${featureName.capitalize}Model.fromJson(Map<String, dynamic> json) =>
      _\$${featureName.capitalize}ModelFromJson(json);
}
""";
