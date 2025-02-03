import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub_dashboard/errors/failures.dart';
import 'package:fruit_hub_dashboard/services/backendpoints.dart';
import 'package:fruit_hub_dashboard/services/database_service.dart';

import '../../../features/main_page/orders/data/models/order_model.dart';
import '../../../features/main_page/orders/domain/entities/models/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  OrdersRepoImpl({required this.dataBaseService});
  DataBaseService dataBaseService;
  @override
  Future<Either<Failures, List<OrderEntity>>> fetchOrders() async {
    try {
      var data = await dataBaseService.getData(path: Backendpoints.orders)
          as List<Map<String, dynamic>>;
      print(data.length);
      print(data);
      List<OrderEntity> products = data
          .map<OrderEntity>(
            (e) => OrderModel.fromJson(e as Map<String, dynamic>).toEntity(),
          )
          .toList();
      print(products.elementAt(1));

      return right(products);
    } catch (e) {
      return left(ServerFailure('failed to load products'));
    }
  }
}
