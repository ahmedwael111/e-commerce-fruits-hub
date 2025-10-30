import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/card_view.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/products_view.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_bottom_nav_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  List<Widget> pages = const [
    HomeView(),
    ProductsView(),
    CardView(),
    Placeholder(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CoustomBottomNavBar(
        selectedIndexCallback: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: IndexedStack(
          // this widget builds all pages at once and shows only the selected one : it's solve the problem of losing state when switching between pages
          index: selectedIndex,
          children: pages,
        ),
      ),
    );
  }
}
