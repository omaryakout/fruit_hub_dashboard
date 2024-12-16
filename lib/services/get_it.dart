import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruit_hub_dashboard/services/database_service.dart';
import 'package:fruit_hub_dashboard/services/firestore_database.dart';
import 'package:fruit_hub_dashboard/services/firestore_service.dart';
import 'package:fruit_hub_dashboard/services/storage_service.dart';
import 'package:fruit_hub_dashboard/services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';

import '../core/repos/images_repo/images_repo.dart';

final getIt = GetIt.instance;




void setupGetit() {
  getIt.registerSingleton<StorageService>(FirestoreService());
  getIt.registerSingleton<DataBaseService>(FireStoreDataBase());

  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(storageService: SupabaseStoargeService()));
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      getIt.get<DataBaseService>(),
    ),
  );
}