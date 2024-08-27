String datasourcesTamplate(String featureName) => """
import '/core/configs/api_config.dart';
import '/core/failure/failure.dart';
import '/core/helpers/api_helper.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '/features/orders/data/models/order_model/order_model.dart';

abstract class BaseOrderRemoteDataSource {
  Future<List<OrderModel>> getOrders({
    PaginationOptions paginationOptions = const PaginationOptions(),
  });

  Future<OrderModel> getOrder({
    required int id,
  });

  Future<OrderModel?> createOrder({
    required OrderModel order,
    bool isUpdate = false,
  });
}

class OrderRemoteDataSource implements BaseOrderRemoteDataSource {
  @override
  Future<OrderModel?> createOrder({
    required OrderModel order,
    bool isUpdate = false,
  }) async {
    Map<String, dynamic>? responceData;
    if (isUpdate) {
      responceData = await APIHelper.post(
        endpoint: '\${APIConfigs.orders}/\${order.id}',
        data: order.toJson(),
      );
    } else {
      responceData = await APIHelper.post(
        endpoint: APIConfigs.orders,
        data: order.toJson(),
      );
    }
    return responceData == null ? null : OrderModel.fromJson(responceData);
  }

  @override
  Future<List<OrderModel>> getOrders({
    PaginationOptions paginationOptions = const PaginationOptions(),
  }) async {
    Map<String, dynamic>? responceData = await APIHelper.get(
      endpoint: APIConfigs.orders,
      queryParameters: {}..addAll(paginationOptions.toJson()),
    );

    if (responceData != null) {
      final List<OrderModel> data = [];
      for (var element in (responceData as List)) {
        data.add(OrderModel.fromJson(element));
      }
      return data;
    } else {
      throw Failure.fromJson(responceData ?? {});
    }
  }

  @override
  Future<OrderModel> getOrder({
    required int id,
  }) async {
    Map<String, dynamic>? responceData = await APIHelper.get(
      endpoint: '\${APIConfigs.orders}/\$id',
    );

    if (responceData != null) {
      return OrderModel.fromJson(responceData);
    } else {
      throw Failure.fromJson(responceData ?? {});
    }
  }
}
""";
