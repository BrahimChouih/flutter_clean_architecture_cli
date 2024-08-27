String repositoryDomainTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/failure/failure.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '/features/orders/data/models/order_model/order_model.dart';

abstract class BaseOrderRepository {
  Future<Either<Failure, List<OrderModel>>> getOrders({
    PaginationOptions paginationOptions = const PaginationOptions(),
  });

  Future<Either<Failure, OrderModel?>> getOrder({
    required int id,
  });

  Future<Either<Failure, OrderModel?>> createOrder({
    required OrderModel order,
    bool isUpdate = false,
  });
}
""";
