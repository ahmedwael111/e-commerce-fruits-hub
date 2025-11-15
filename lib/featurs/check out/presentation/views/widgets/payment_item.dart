import 'package:e_commerce_fruits_hub/core/utils/app_decoration.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.bold13),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: AppDecoration.grayContainarDecoration,
          child: child,
        ),
      ],
    );
  }
}
