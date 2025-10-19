import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_bottom_nav_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CoustomBottomNavBar(),
      body: SafeArea(child: HomeView()),
    );
  }
}
