import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          'صباح الخير !..',
          textAlign: TextAlign.right,
          style: AppTextStyles.regular16.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
        subtitle: Text(
          'أحمد مصطفي',
          textAlign: TextAlign.right,
          style: AppTextStyles.bold16.copyWith(color: Colors.black),
        ),
        trailing: Container(
          width: 34,
          height: 34,
          decoration: ShapeDecoration(
            color: const Color(0xFFEEF8ED) /* green-50 */,
            shape: OvalBorder(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(Assets.assetsNotification1),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(3),
          child: Image.asset(Assets.assetsProfile),
        ),
      ),
    );
  }
}
