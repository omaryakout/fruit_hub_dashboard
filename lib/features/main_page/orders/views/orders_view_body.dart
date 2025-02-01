import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/domain/entities/models/order_entity.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/manager/orders_stream_cubit/orders_stream_cubit.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/views/order_item.dart';
import 'package:fruit_hub_dashboard/helper_functions/get_order_dummy_data.dart';
import 'package:fruit_hub_dashboard/services/database_service.dart';
import 'package:fruit_hub_dashboard/services/firestore_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/domain/entities/models/order_entity.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/manager/orders_stream_cubit/orders_stream_cubit.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/views/order_item.dart';
import 'package:fruit_hub_dashboard/services/database_service.dart';
import 'package:fruit_hub_dashboard/services/firestore_database.dart';

// class OrdersViewBody extends StatelessWidget {
//   late OrdersStreamCubit ordersCubit;
//   List<OrderEntity> orders = [
//     getDummyOrder(),
//     getDummyOrder(),
//     getDummyOrder(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return  ListView.builder(
//       itemCount:orders.length ,
//       itemBuilder: (context, index) {
//                 return OrderItemWidget(orderModel: orders[index]);
//               },
//             );
//           }
//          // ✅ Default state

//   }

class OrdersViewBody extends StatefulWidget {
  const OrdersViewBody({super.key});

  @override
  State<OrdersViewBody> createState() => _OrdersViewBodyState();
}

class _OrdersViewBodyState extends State<OrdersViewBody> {
  late OrdersStreamCubit ordersCubit;

  @override
  void initState() {
    super.initState();
    ordersCubit = OrdersStreamCubit();
    ordersCubit.loadOrders();
    
    // Call function automatically
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ordersCubit,
      child: BlocBuilder<OrdersStreamCubit, OrdersStreamState>(
        builder: (context, state) {
          if (state is OrdersStreamLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrdersStreamFailure) {
            return Center(child: Text('Error: ${state.errMessage}'));
          } else if (state is OrdersStreamSuccess) {
            return ListView.builder(
              itemCount: state.ordersList.length,
              itemBuilder: (context, index) {
                return OrderItemWidget(orderModel: state.ordersList[index]);
              },
            );
          }
          return const Center(child: Text('No orders available.'));
        },
      ),
    );
  }
}




// class OrdersViewBody extends StatelessWidget {
//    OrdersViewBody({super.key, this.ordersList});
//  List<OrderEntity>?ordersList;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>OrdersStreamCubit (
//         ordersRepo: OrdersRepoImpl(
//           dataBaseService: FireStoreDataBase()
//         )
//       ),
//       child: BlocConsumer<OrdersStreamCubit, OrdersStreamState>(
//         listener: (context, state) {
//          if(state is OrdersStreamSuccess){
//           ordersList = state.ordersList;
//          }
//         },
//         builder: (context, state) {
//           return ListView.builder(
//             itemCount:ordersList!.length ,
//             itemBuilder: (context, index) {
//             OrderItemWidget(orderModel:ordersList![index] ,);
//           },);
//         },
//       ),
//     );
//   }
// }