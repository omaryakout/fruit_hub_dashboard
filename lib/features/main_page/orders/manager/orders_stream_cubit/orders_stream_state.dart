part of 'orders_stream_cubit.dart';

@immutable
sealed class OrdersStreamState {}

final class OrdersStreamInitial extends OrdersStreamState {}

final class OrdersStreamLoading extends OrdersStreamState {}

final class OrdersStreamSuccess extends OrdersStreamState {
  List<OrderEntity>ordersList;
  OrdersStreamSuccess(this.ordersList);
}

final class OrdersStreamFailure extends OrdersStreamState {
  final String errMessage;
  OrdersStreamFailure(this.errMessage);
}
