
import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/core/utils/dark_theme_cubite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ProfileListViewEntity {
  final String leading;
  final String title;
  final Widget trailing;
  const ProfileListViewEntity({
    required this.leading,
    required this.title,
    required this.trailing,
  });
}

List<ProfileListViewEntity> profileListViewEntity(context) => [
  ProfileListViewEntity(
    leading: Assets.assetsUser2x,
    title: 'الملف الشخصي',
    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 22),
  ),
  ProfileListViewEntity(
    leading: Assets.assetsBoxMyOrders,
    title: 'طلباتي',
    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 22),
  ),
  ProfileListViewEntity(
    leading: Assets.assetsEmptyWallet,
    title: 'المدفوعات',
    trailing: const Icon(Icons.arrow_forward_ios, size: 22),
  ),
  ProfileListViewEntity(
    leading: Assets.assetsHeart,
    title: 'المفضلة',
    trailing: const Icon(Icons.arrow_forward_ios, size: 22),
  ),
  ProfileListViewEntity(
    leading: Assets.assetsNotification2x,
    title: 'الاشعارات',
    trailing: Transform.scale(
      scale: MediaQuery.of(context).size.width * 0.002,
      child: FlutterSwitch(
        value: true,
        activeColor: AppColors.primaryColor,
        width: 55,
        onToggle: (value) {},
      ),
    ),
  ),
  ProfileListViewEntity(
    leading: Assets.assetsGlobal,
    title: 'اللغة',
    trailing: Row(
      children: [
        Text('العربية', style: AppTextStyles.regular13),
        const Icon(Icons.arrow_forward_ios, size: 22),
      ],
    ),
  ),
  ProfileListViewEntity(
    leading: Assets.assetsMagicpen,
    title: 'الوضع الداكن',
    trailing: Transform.scale(
      scale: MediaQuery.of(context).size.width * 0.002,
      child: BlocBuilder<ThemeCubitCubit, ThemeData>(
        builder: (context, state) {
          return FlutterSwitch(
            value: state.brightness == Brightness.dark,
            activeColor: AppColors.primaryColor,
            // toggleSize: 10,
            width: 55,
            // valueFontSize: 13,
            onToggle: (value) {
              BlocProvider.of<ThemeCubitCubit>(context).toggleTheme();
            },
          );
        },
      ),
    ),
  ),
];
