import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/card_view.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/home_view.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/products_view.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class PersistentNavBar extends StatefulWidget {
  const PersistentNavBar({super.key});

  @override
  State<PersistentNavBar> createState() => _PersistentNavBarState();
}

class _PersistentNavBarState extends State<PersistentNavBar> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  // Screens
  List<Widget> pages = const [
    HomeView(),
    ProductsView(),
    CardView(),
    ProfileView(),
  ];

  // NAV BAR ITEMS
  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined, size: width * 0.06),
        title: "الرئيسية",
        activeColorPrimary: AppColors.primaryColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey[600],
        textStyle: TextStyle(
          fontSize: width * 0.033,
          fontWeight: FontWeight.bold,
          // color: AppColors.primaryColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.grid_view_rounded, size: width * 0.06),
        title: "المنتجات",
        activeColorPrimary: AppColors.primaryColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey[600],
        textStyle: TextStyle(
          fontSize: width * 0.033,
          fontWeight: FontWeight.bold,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart_outlined, size: width * 0.06),
        title: "السلة",
        activeColorPrimary: AppColors.primaryColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey[600],
        textStyle: TextStyle(
          fontSize: width * 0.033,
          fontWeight: FontWeight.bold,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline, size: width * 0.06),
        title: "حسابي",
        activeColorPrimary: AppColors.primaryColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey[600],
        textStyle: TextStyle(
          fontSize: width * 0.033,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return PersistentTabView(
      context,
      controller: _controller,
      screens: pages,
      items: _navBarsItems(context),
      navBarHeight: width * 0.18,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      // hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      navBarStyle: NavBarStyle.style7,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.02,
      ),
    );
  }
}
