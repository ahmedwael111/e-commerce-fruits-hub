import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/widgets/cached_netwok_image.dart';
import 'package:e_commerce_fruits_hub/core/widgets/custom_fav_bottom.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/one_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class FruitItem extends StatefulWidget {
  const FruitItem({super.key, required this.product});
  final ProductEntity product;

  @override
  State<FruitItem> createState() => _FruitItemState();
}

class _FruitItemState extends State<FruitItem> {
  var active = false;
  @override
  @override
  Widget build(BuildContext context) {
    CardItemEntity cardItemEntity = CardItemEntity(
      productEntity: widget.product,
      quantity: 0,
    );
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: OneProductView(
            productEntity: widget.product,
            cardItemEntity: cardItemEntity,
            contextOfCubit: context,
          ),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFF3F5F7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: 12),
                  SizedBox(
                    height: height * 0.11,
                    child:
                        widget.product.imageUrl != null
                            ? Flexible(
                              fit: FlexFit.loose,
                              child: Flexible(
                                child: CustomNetworkImage(
                                  imageUrl: widget.product.imageUrl!,
                                ),
                              ),
                            )
                            : Container(
                              color: Colors.grey,
                              width: width * 0.22,
                              height: height * 0.07,
                            ),
                  ),

                  Expanded(child: SizedBox(height: 14)),
                  ListTile(
                    title: Text(
                      widget.product.name,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.simibold13,
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${widget.product.price} جنية ',
                            style: AppTextStyles.bold13.copyWith(
                              color:
                                  AppColors.secondaryColor /* Grayscale-900 */,
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 6),

                    trailing: GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().addToCart(widget.product);
                      },
                      child: Container(
                        width: 33,
                        height: 33,
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

            Positioned(
              top: 0,
              right: 0,
              child: CustomFavBottom(product: widget.product),
            ),
          ],
        ),
      ),
    );
  }
}
