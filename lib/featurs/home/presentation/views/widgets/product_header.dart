import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/best_selling_fruit/presentation/views/best_selling_view.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key, required this.resultsCount});
  final int resultsCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$resultsCount نتائج ',
          textAlign: TextAlign.right,
          style: AppTextStyles.bold16,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {},
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
