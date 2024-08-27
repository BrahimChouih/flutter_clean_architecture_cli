String getDetailsUseCaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/features/orders/data/models/order_model/order_model.dart';
import '/features/orders/domain/repositories/base_order_repository.dart';

import '../../../core/failure/failure.dart';

class GetOrderDetailsUsecase {
  final BaseOrderRepository repository;

  GetOrderDetailsUsecase(this.repository);

  Future<Either<Failure, OrderModel?>> call({
    required int id,
  }) async {
    return await repository.getOrder(
      id: id,
    );
  }
}
""";
