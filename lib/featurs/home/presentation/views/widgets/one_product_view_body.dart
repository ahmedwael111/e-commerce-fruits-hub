import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/core/widgets/cached_netwok_image.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          Assets.assetsEllipseOfProduct,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: width * 0.25,
                        right: width * 0.25,
                        child: CustomNetworkImage(
                          imageUrl: productEntity.imageUrl!,
                          scaleValue: 0.8,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productEntity.name,
                                textAlign: TextAlign.right,
                                style: AppTextStyles.bold16,
                              ),
                              SizedBox(height: 4),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${productEntity.price.round()}  جنيه',
                                      style: AppTextStyles.bold13.copyWith(
                                        color:
                                            AppColors
                                                .secondaryColor /* Grayscale-900 */,
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
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 9,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                    size: 20,
                                  ),
                                  Text('4.5', style: AppTextStyles.simibold13),
                                  Text(
                                    '(30+)',
                                    style: AppTextStyles.regular13.copyWith(
                                      color: const Color(0xFF9796A1),
                                    ),
                                  ),

                                  Text(
                                    'المراجعه',
                                    style: AppTextStyles.bold13.copyWith(
                                      color: AppColors.primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox(width: 20)),
                          ActionBottonsOfOneProduct(
                            productEntity: productEntity,
                            cardItemEntity: cardItemEntity,
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        productEntity.description,
                        style: AppTextStyles.regular13.copyWith(
                          color: const Color(0xFF9796A1),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: OrganicsItem(
                              image: Assets.assetsCalendar,
                              title: ' ${productEntity.expirationMonth} شهر.',
                              subTitle: 'الصلاحيه',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: OrganicsItem(
                              image: Assets.assetsOrganic,
                              title: productEntity.isOrganic ? '100%' : '0%',
                              subTitle: 'ارجانيك',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: OrganicsItem(
                              image: Assets.assetsCaloris,
                              title: '${productEntity.numberOfCalorys} كالوريا',
                              subTitle: '100 جرام',
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: OrganicsItem(
                              image: Assets.assetsStar,
                              title:
                                  '${productEntity.avrageRate} (${productEntity.ratingCount})',
                              subTitle: 'Reviews',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      CoustomBottom(
                        onPressed: () {
                          context.read<CartCubit>().addToCart(
                            productEntity,
                            quantityNew: cardItemEntity?.quantity,
                          );
                          // cardItemEntity?.incementQuantity();
                          Navigator.pop(context);
                        },
                        text: 'اضافة الى السلة',
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
        ActionBottonForProduct(
          backgroundColor: AppColors.primaryColor,
          child: Center(child: Icon(Icons.add, color: Colors.white, size: 28)),
          onTap: () {
            widget.cardItemEntity?.incementQuantity();
            context.read<CartItemCubit>().updateCartItem(
              cartItemEntity: widget.cardItemEntity,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.cardItemEntity?.quantity.toString() ??
                '0', // productEntity.quantity.toString()
            textAlign: TextAlign.center,
            style: AppTextStyles.bold16,
          ),
        ),
        ActionBottonForProduct(
          backgroundColor: const Color(0xFFF3F5F7),
          child: Icon(Icons.remove, color: Colors.grey, size: 28),
          onTap: () {
            widget.cardItemEntity?.decrementQuantity();
            context.read<CartItemCubit>().updateCartItem(
              cartItemEntity: widget.cardItemEntity,
            );
          },
        ),
      ],
    );
  }
}

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

class OrganicsItem extends StatelessWidget {
  const OrganicsItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 4, right: 4, bottom: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFFF1F1F5)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bold13.copyWith(
                      color: AppColors.lightprimaryColor,
                    ),
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.simibold13.copyWith(
                      color: const Color(0xFF969899),
                    ),
                  ),
                ],
              ),

              Image.asset(image, scale: 2),
            ],
          ),
        ],
      ),
    );
  }
}
