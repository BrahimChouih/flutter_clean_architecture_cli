String modelTemplate(String featureName) => """
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _\$OrderModel {
  const OrderModel._();

  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  factory OrderModel({
    int? id,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _\$OrderModelFromJson(json);
}
""";
