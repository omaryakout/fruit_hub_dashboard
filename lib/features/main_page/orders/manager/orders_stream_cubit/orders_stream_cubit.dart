import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/data/models/order_model.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/domain/entities/models/order_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../core/repos/orders_repo/orders_repo.dart';
import '../../../../../services/backendpoints.dart';

part 'orders_stream_state.dart';

class OrdersStreamCubit extends Cubit<OrdersStreamState> {
  OrdersStreamCubit() : super(OrdersStreamInitial());

  void loadOrders() async {
    emit(OrdersStreamLoading());
    try {
      var ordersFromFireBase = await FirebaseFirestore.instance
          .collection(Backendpoints.orders)
          .get();
      List<OrderEntity> orders = [];
      List<OrderEntity> loadedOrders = ordersFromFireBase.docs.map<OrderEntity>(
        (e) {
          return OrderModel.fromJson(e.data()).toEntity();
        },
      ).toList();
      print(orders);
      orders = loadedOrders;
      emit(OrdersStreamSuccess(orders));
    } catch (e) {
      emit(OrdersStreamFailure(e.toString()));
    }
  }
}
