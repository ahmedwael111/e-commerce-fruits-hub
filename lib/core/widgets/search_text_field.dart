import 'package:e_commerce_fruits_hub/core/cubits/products/search_product_cubit/search_product_cubit.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key, this.focusNode});
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        focusNode: focusNode,

        onSubmitted: (value) {
          context.read<SearchProductCubit>().searchProducts(value);
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'ابحث عن.......',
          hintStyle: AppTextStyles.regular13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          prefixIcon: SizedBox(
            width: 20,
            child: Center(child: SvgPicture.asset(Assets.assetsSearchNormal)),
          ),
          suffixIcon: SizedBox(
            width: 20,

            child: GestureDetector(
              onTap: () {
                //open filter bottom sheet
                customBottomSheet(context, 'SearchproductsCubit');
              },
              child: Center(child: SvgPicture.asset(Assets.assetsSetting4)),
            ),
          ),
          suffixIconColor: const Color(0xFF949D9E),

          filled: true,
          fillColor: Colors.white,
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white, width: 1),
    );
  }
}
