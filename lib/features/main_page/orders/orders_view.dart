import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/views/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
static const routeName = 'orders page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrdersViewBody());
  }
}