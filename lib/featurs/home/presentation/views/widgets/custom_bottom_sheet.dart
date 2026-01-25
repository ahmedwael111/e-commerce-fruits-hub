import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/search_product_cubit/search_product_cubit.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> customBottomSheet(BuildContext context, String cubitEnabled) {
  String? selectedSort;
  final productsCubit = context.read<ProductsCubit>();
  final searchproductsCubit = context.read<SearchProductCubit>();
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    useRootNavigator: true,
    isDismissible: true,
    isScrollControlled: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder:
            (BuildContext context, StateSetter setState) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 4,
                        decoration: ShapeDecoration(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  // Header
                  Text(
                    'ترتيب حسب :',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bold19.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 11),
                  // Option 1: Low to High
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Radio<String>(
                        value: 'low_to_high',
                        groupValue: selectedSort,
                        onChanged: (String? value) {
                          setState(() {
                            selectedSort = value;
                          });
                        },
                      ),

                      Text(
                        'السعر ( الأقل الي الأعلي )',
                        style: AppTextStyles.bold13,
                      ),
                    ],
                  ),
                  // Option 2: High to Low
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Radio<String>(
                        value: 'high_to_low',
                        groupValue: selectedSort,
                        onChanged: (String? value) {
                          setState(() {
                            selectedSort = value;
                          });
                        },
                      ),

                      Text(
                        'السعر ( الأعلى إلى الأقل )',
                        textAlign: TextAlign.right,
                        style: AppTextStyles.simibold13.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  // Option 3: Newest
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Radio<String>(
                        value: 'newest',
                        groupValue: selectedSort,
                        onChanged: (String? value) {
                          setState(() {
                            selectedSort = value;
                          });
                        },
                      ),

                      Text(
                        'الأبجديه',
                        textAlign: TextAlign.right,
                        style: AppTextStyles.simibold13.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  // Filter Button
                  CoustomBottom(
                    onPressed: () {
                      if (cubitEnabled == 'productsCubit') {
                        productsCubit.changeSort(selectedSort!);
                      } else if (cubitEnabled == 'SearchproductsCubit') {
                        searchproductsCubit.changeSort(selectedSort!);
                      }
                      Navigator.pop(context);
                    },
                    text: 'تصفية',
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
      );
    },
  );
}
