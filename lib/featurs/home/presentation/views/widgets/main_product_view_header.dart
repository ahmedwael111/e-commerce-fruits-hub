import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/Product_search_result.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/custom_bottom_sheet.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainProductsViewHeader extends StatefulWidget {
  const MainProductsViewHeader({super.key});

  @override
  State<MainProductsViewHeader> createState() => _MainProductsViewHeaderState();
}

class _MainProductsViewHeaderState extends State<MainProductsViewHeader> {
 
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'منتجاتنا',
          textAlign: TextAlign.right,
          style: AppTextStyles.bold16,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            customBottomSheet(context , 'productsCubit');
            
          },

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: ShapeDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: const Color(0x66CACECE)),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Image.asset(Assets.assetsFilterTwo, scale: 4),
          ),
        ),
      ],
    );
  }

  
}
