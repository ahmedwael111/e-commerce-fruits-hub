import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/widgets/cached_netwok_image.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.favorite_border_outlined),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 12),
                product.imageUrl != null
                    ? Flexible(
                      fit: FlexFit.loose,
                      child: CustomNetworkImage(imageUrl: product.imageUrl!),
                    )
                    : Container(color: Colors.grey, width: 100, height: 100),

                SizedBox(height: 14),
                ListTile(
                  title: Text(
                    product.name,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.simibold13,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' ${product.price}جنية',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor /* Grayscale-900 */,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppTextStyles.bold13.copyWith(
                            color:
                                AppColors
                                    .lightSecondaryColor /* Grayscale-900 */,
                          ),
                        ),
                        TextSpan(
                          text: ' الكيلو',
                          style: AppTextStyles.bold13.copyWith(
                            color:
                                AppColors
                                    .lightSecondaryColor /* Grayscale-500 */,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: GestureDetector(
                    onTap: () { 
                      context.read<CartCubit>().addToCart(product);
                    },
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor /* green-50 */,
                        shape: OvalBorder(),
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        size: 32,
                        color: Colors.white /* green-300 */,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
