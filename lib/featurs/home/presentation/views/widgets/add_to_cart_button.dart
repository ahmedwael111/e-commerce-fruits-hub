import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Add to Cart Button widget
class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productEntity,
    required this.cardItemEntity,
  });

  final ProductEntity productEntity;
  final CardItemEntity? cardItemEntity;

  @override
  Widget build(BuildContext context) {
    return CoustomBottom(
      onPressed: () {
        context.read<CartCubit>().addToCart(
          productEntity,
          quantityNew: cardItemEntity?.quantity,
        );
        Navigator.pop(context);
      },
      text: 'اضافة الى السلة',
    );
  }
}
