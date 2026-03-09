import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'quantity_action_button.dart';

const Color _removeButtonBackgroundColor = Color(0xFFF3F5F7);
const Color _removeButtonIconColor = Colors.grey;

class ActionBottonsOfOneProduct extends StatefulWidget {
  const ActionBottonsOfOneProduct({
    super.key,
    required this.productEntity,
    this.cardItemEntity,
  });

  final ProductEntity productEntity;
  final CardItemEntity? cardItemEntity;

  @override
  State<ActionBottonsOfOneProduct> createState() =>
      _ActionBottonsOfOneProductState();
}

class _ActionBottonsOfOneProductState extends State<ActionBottonsOfOneProduct> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuantityActionButton(
          backgroundColor: AppColors.primaryColor,
          icon: Icons.add,
          iconColor: Colors.white,
          onTap: _onIncrementQuantity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.cardItemEntity?.quantity.toString() ?? '0',
            textAlign: TextAlign.center,
            style: AppTextStyles.bold16,
          ),
        ),
        QuantityActionButton(
          backgroundColor: _removeButtonBackgroundColor,
          icon: Icons.remove,
          iconColor: _removeButtonIconColor,
          onTap: _onDecrementQuantity,
        ),
      ],
    );
  }

  void _onIncrementQuantity() {
    widget.cardItemEntity?.incementQuantity();
    context.read<CartItemCubit>().updateCartItem(
      cartItemEntity: widget.cardItemEntity,
    );
  }

  void _onDecrementQuantity() {
    widget.cardItemEntity?.decrementQuantity();
    context.read<CartItemCubit>().updateCartItem(
      cartItemEntity: widget.cardItemEntity,
    );
  }
}

/// Generic action button widget
class ActionBottonForProduct extends StatelessWidget {
  const ActionBottonForProduct({
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
        width: 36,
        height: 36,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: child,
      ),
    );
  }
}
