import 'package:e_commerce_fruits_hub/core/utils/assets.dart';

class BottomNavbarIconEntity {
  final String activeIcon, inactiveIcon;
  final String name;
  BottomNavbarIconEntity({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.name,
  });
}

List<BottomNavbarIconEntity> bottomNavbarIconList = [
  BottomNavbarIconEntity(
    activeIcon: Assets.assetsHomeIconBold,
    inactiveIcon: Assets.assetsHomeIconOutline,
    name: 'الرئيسية',
  ),
  BottomNavbarIconEntity(
    activeIcon: Assets.assetsProductIconBold,
    inactiveIcon: Assets.assetsProductsOutline,
    name: 'المنتجات',
  ),
  BottomNavbarIconEntity(
    activeIcon: Assets.assetsShoppingCarBoldt,
    inactiveIcon: Assets.assetsShoppingCartOutline,
    name: 'سلة التسوق',
  ),
  BottomNavbarIconEntity(
    activeIcon: Assets.assetsProfileBold,
    inactiveIcon: Assets.assetsProfileIconOutline,
    name: 'حسابي',
  ),
];
