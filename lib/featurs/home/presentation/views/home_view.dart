import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_bottom_nav_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: HomeViewBody()),
    bottomNavigationBar:CoustomBottomNavBar() ,
    );
  }
}
