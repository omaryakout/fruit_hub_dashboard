import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub_dashboard/errors/failures.dart';
import 'package:fruit_hub_dashboard/services/backendpoints.dart';
import 'package:fruit_hub_dashboard/services/database_service.dart';

// class OrdersRepoImpl implements OrdersRepo {
//   OrdersRepoImpl({required this.dataBaseService});
//   DataBaseService dataBaseService;
//   @override
//   Future<Either<Failures, Map<String,dynamic>>> fetchOrders() async {
//     try {
//       // var orders =await dataBaseService.getData(path: Backendpoints.orders);
//       // return right(orders);
//     } catch (e) {
//       return left(ServerFailure(e.toString()));
//     }
//   }
// }
