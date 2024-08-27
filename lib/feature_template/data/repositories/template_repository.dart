String repositoryDataTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/failure/failure.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '/features/orders/data/models/order_model/order_model.dart';
import '/features/orders/domain/repositories/base_order_repository.dart';

import '../datasource/order_remote_datasource.dart';

class OrderRepository implements BaseOrderRepository {
  final BaseOrderRemoteDataSource remoteDataSource;

  OrderRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, OrderModel?>> createOrder({
    required OrderModel order,
    bool isUpdate = false,
  }) async {
    try {
      return Right(
        await remoteDataSource.createOrder(
          order: order,
          isUpdate: isUpdate,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders({
    PaginationOptions paginationOptions = const PaginationOptions(),
  }) async {
    try {
      return Right(
        await remoteDataSource.getOrders(
          paginationOptions: paginationOptions,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, OrderModel?>> getOrder({required int id}) async {
    try {
      return Right(
        await remoteDataSource.getOrder(
          id: id,
        ),
      );
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
""";
