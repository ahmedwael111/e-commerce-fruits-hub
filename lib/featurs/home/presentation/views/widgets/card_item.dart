import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/core/widgets/cached_netwok_image.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/action_bottons_ofCardItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.cardItemEntity});
  final CardItemEntity cardItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cardItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomNetworkImage(
                    imageUrl: cardItemEntity.productEntity.imageUrl!,
                  ),
                ),
              ),
              SizedBox(width: 17),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          cardItemEntity.productEntity.name,
                          style: AppTextStyles.bold13,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().removeCartItem(
                              cardItemEntity,
                            );
                          },
                          child: Image.asset(Assets.assetsTrash, scale: 4),
                        ),
                      ],
                    ),

                    Text(
                      '${cardItemEntity.calculateTotalWeight()} كم',
                      textAlign: TextAlign.right,
                      style: AppTextStyles.regular13.copyWith(
                        color: const Color(0xFFF4A91F),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        ActionBottonsOfcarditem(cardItemEntity: cardItemEntity),
                        Spacer(),
                        Text(
                          '${cardItemEntity.calculateTotalPrice()} جنيه',
                          style: AppTextStyles.bold16.copyWith(
                            color: const Color(0xFFF4A91F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
