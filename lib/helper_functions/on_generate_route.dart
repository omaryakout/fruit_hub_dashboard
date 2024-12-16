import 'package:flutter/material.dart';

import '../features/main_page/main_page.dart';
import '../features/main_page/product_page.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainPage.routeName:
      return MaterialPageRoute(builder: (context) => const MainPage());
        case ProductPage.routeName:
      return MaterialPageRoute(builder: (context) => const ProductPage()); 
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
