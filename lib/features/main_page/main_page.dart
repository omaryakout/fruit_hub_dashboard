import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/main_page/orders/orders_view.dart';
import 'package:fruit_hub_dashboard/features/main_page/product_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/featured_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const routeName = 'main page';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            FeaturedButton(
              text: 'add product',
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await FirebaseAuth.instance.signInAnonymously();
                  print(userCredential.user);
                } catch (e) {
                  print('Failed to sign in anonymously: $e');
                  return;
                }
                Navigator.pushNamed(context, ProductPage.routeName);
              },
            ),
           SizedBox(height: 6,),
            FeaturedButton(
              text: 'view orders',
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await FirebaseAuth.instance.signInAnonymously();
                  print(userCredential.user);
                } catch (e) {
                  print('Failed to sign in anonymously: $e');
                  return;
                }
                Navigator.pushNamed(context, OrdersView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
