String createUseCaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/features/orders/data/models/order_model/order_model.dart';
import '/features/orders/domain/repositories/base_order_repository.dart';

import '../../../core/failure/failure.dart';

class CreateOrderUsecase {
  final BaseOrderRepository repository;

  CreateOrderUsecase(this.repository);

  Future<Either<Failure, OrderModel?>> call({
    required OrderModel order,
  }) async {
    return await repository.createOrder(
      order: order,
    );
  }

  Future<Either<Failure, OrderModel?>> update({
    required OrderModel order,
  }) async {
    return await repository.createOrder(
      order: order,
      isUpdate: true,
    );
  }
}
""";
