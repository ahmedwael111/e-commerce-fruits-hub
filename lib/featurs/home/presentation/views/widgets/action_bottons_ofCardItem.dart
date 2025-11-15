import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionBottonsOfcarditem extends StatelessWidget {
  const ActionBottonsOfcarditem({super.key, required this.cardItemEntity});
  final CardItemEntity cardItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionBotton(
          backgroundColor: AppColors.primaryColor,
          child: Center(child: Icon(Icons.add, color: Colors.white, size: 18)),
          onTap: () {
            cardItemEntity.incementQuantity();
            context.read<CartItemCubit>().updateCartItem(cardItemEntity);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            cardItemEntity.quantity.toString(),
            textAlign: TextAlign.center,
            style: AppTextStyles.bold16,
          ),
        ),
        ActionBotton(
          backgroundColor: const Color(0xFFF3F5F7),
          child: Icon(Icons.remove, color: Colors.grey, size: 18),
          onTap: () {
            cardItemEntity.decrementQuantity();
            context.read<CartItemCubit>().updateCartItem(cardItemEntity);
          },
        ),
      ],
    );
  }
}

class ActionBotton extends StatelessWidget {
  const ActionBotton({
    super.key,
    this.onTap,
    this.child,
    required this.backgroundColor,
  });
  final VoidCallback? onTap;
  final Widget? child;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: backgroundColor /* Green1-500 */,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: child,
      ),
    );
  }
}
