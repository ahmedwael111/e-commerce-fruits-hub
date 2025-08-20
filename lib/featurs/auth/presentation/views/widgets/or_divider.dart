import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text('أو', style: AppTextStyles.simibold16),
        ),
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
      ],
    );
  }
}
