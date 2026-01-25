import 'package:e_commerce_fruits_hub/core/cubits/products/search_product_cubit/search_product_cubit.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/categores_of_products_enitites.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/Product_search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class OurProductsItem extends StatelessWidget {
  const OurProductsItem({super.key, required this.category});
  final CategoriesOfProductsEntity category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: ProductSearchResultView(categoryName: category.name),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.fade,
         
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 2,
        children: [
          Stack(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF3F5F7),
                  shape: OvalBorder(),
                ),
              ),
              Positioned(
                left: 14,
                top: 14,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(category.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            category.name,
            textAlign: TextAlign.right,
            style: AppTextStyles.simibold13,
          ),
        ],
      ),
    );
  }
}
