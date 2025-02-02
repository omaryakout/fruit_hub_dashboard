import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/errors/failures.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/domain/entities/models/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failures, List<OrderEntity>>> fetchOrders();
}
