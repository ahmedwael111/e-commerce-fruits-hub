import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CoustomBottom extends StatelessWidget {
  const CoustomBottom({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
