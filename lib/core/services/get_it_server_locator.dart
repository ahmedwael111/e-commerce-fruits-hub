import 'package:e_commerce_fruits_hub/core/repos/orders_repo/orders_reop_impl.dart';
import 'package:e_commerce_fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo_impl.dart';
import 'package:e_commerce_fruits_hub/core/services/database_service.dart';
import 'package:e_commerce_fruits_hub/core/services/firebase_auth_service.dart';
import 'package:e_commerce_fruits_hub/core/services/firebase_firestor_servece.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/repos/auth_repo_implementation.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DatabaseService>(FirebaseFirestorService());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<OrdersRepo>(
    OrdersReopImpl(databaseService: getIt<DatabaseService>()),
  );
}
