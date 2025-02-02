import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_dashboard/errors/failures.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/data/models/order_model.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/domain/entities/models/order_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../core/repos/orders_repo/orders_repo.dart';
import '../../../../../core/repos/orders_repo/orders_repo_impl.dart';
import '../../../../../services/backendpoints.dart';

part 'orders_stream_state.dart';

class OrdersStreamCubit extends Cubit<OrdersStreamState> {
  OrdersStreamCubit({required this.ordersRepo}) : super(OrdersStreamInitial());
  OrdersRepo ordersRepo;
  void loadOrders() async {
    emit(OrdersStreamLoading());
    var result = await ordersRepo.fetchOrders();
    result.fold(
      (l) => emit(OrdersStreamFailure(l.message)),
      (r) => emit(OrdersStreamSuccess(r)),
    );
  }
}
