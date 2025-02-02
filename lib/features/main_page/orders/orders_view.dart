import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/manager/orders_stream_cubit/orders_stream_cubit.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/views/orders_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/repos/orders_repo/orders_repo_impl.dart';
import '../../../services/firestore_database.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = 'orders page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return OrdersStreamCubit(
            ordersRepo: OrdersRepoImpl(dataBaseService: FireStoreDataBase()));
      },
      child: OrdersViewBody(),
    );
  }
}
