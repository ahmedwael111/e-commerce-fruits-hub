import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_to_cart_button.dart';
import 'product_description.dart';
import 'product_details_row.dart';
import 'product_image_section.dart';
import 'product_specifications_section.dart';

const double _horizontalSpacing = 24;
const double _verticalSpacing = 8;

class OneProductViewBody extends StatelessWidget {
  const OneProductViewBody({
    super.key,
    required this.productEntity,
    this.cardItemEntity,
  });

  final ProductEntity productEntity;
  final CardItemEntity? cardItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductImageSection(productEntity: productEntity),
                SizedBox(height: _horizontalSpacing),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: Column(
                    children: [
                      ProductDetailsRow(
                        productEntity: productEntity,
                        cardItemEntity: cardItemEntity,
                      ),
                      SizedBox(height: _verticalSpacing),
                      ProductDescription(
                        description: productEntity.description,
                      ),
                      SizedBox(height: 20),
                      ProductSpecificationsSection(
                        productEntity: productEntity,
                      ),
                      SizedBox(height: _horizontalSpacing),
                      AddToCartButton(
                        productEntity: productEntity,
                        cardItemEntity: cardItemEntity,
                      ),
                      SizedBox(height: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
