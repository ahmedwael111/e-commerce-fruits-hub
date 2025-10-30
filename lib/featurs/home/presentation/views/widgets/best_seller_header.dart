import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/best_selling_fruit/presentation/views/best_selling_view.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:flutter/material.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the Best Selling view
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        children: [
          Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: AppTextStyles.bold16,
          ),
          Spacer(),
          Text(
            'المزيد',
            textAlign: TextAlign.center,
            style: AppTextStyles.regular13.copyWith(
              color: const Color(0xFF949D9E) /* Grayscale-500 */,
            ),
          ),
        ],
      ),
    );
  }
}
