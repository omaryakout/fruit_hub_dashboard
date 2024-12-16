import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/add_product/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/features/main_page/main_page.dart';
import 'package:fruit_hub_dashboard/helper_functions/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_hub_dashboard/keys.dart';
import 'package:fruit_hub_dashboard/services/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/repos/product_repo/product_repo.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/supabase_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await SupabaseStoargeService.initSupabase();

    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        imagesRepo: getIt.get<ImagesRepo>(),
        productRepo: getIt.get<ProductRepo>(),
      ),
      child: MaterialApp(
        initialRoute: 'main page',
        title: 'add data',
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
