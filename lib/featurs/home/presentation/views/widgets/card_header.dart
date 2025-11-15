import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      // clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: const Color(0xFFEBF9F1) /* Green1-50 */),
      child: Text(
        'لديك ${context.watch<CartCubit>().cartEntity.cardItems.length} منتجات في سله التسوق',
        textAlign: TextAlign.center,
        style: AppTextStyles.regular13.copyWith(
          // fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
