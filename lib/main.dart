import 'package:e_commerce_fruits_hub/core/helper_functions.dart/routs.dart';
import 'package:e_commerce_fruits_hub/featurs/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FruitsHubApp());
}

class FruitsHubApp extends StatelessWidget {
  const FruitsHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: generateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,);
  }
}
