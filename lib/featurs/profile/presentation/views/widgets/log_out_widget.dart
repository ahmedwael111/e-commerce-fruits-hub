import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:flutter/material.dart';

class LogOutProfileWidget extends StatelessWidget {
  const LogOutProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      // clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: const Color(0xFFEBF9F1) /* Green1-50 */),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'تسجيل الخروج',
            textAlign: TextAlign.center,
            style: AppTextStyles.simibold13.copyWith(
              // fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(width: 90),
          Image.asset(Assets.assetsLogout, scale: 1.5),
          SizedBox(width: 50),
        ],
      ),
    );
  }
}