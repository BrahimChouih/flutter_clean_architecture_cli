String getUsecaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '/features/orders/data/models/order_model/order_model.dart';
import '/features/orders/domain/repositories/base_order_repository.dart';

import '../../../core/failure/failure.dart';

class GetOrdersUsecase {
  final BaseOrderRepository repository;

  GetOrdersUsecase(this.repository);

  Future<Either<Failure, List<OrderModel>>> call({
    int? id,
    PaginationOptions paginationOptions = const PaginationOptions(),
  }) async {
    return await repository.getOrders(
      paginationOptions: paginationOptions,
    );
  }
}
""";
