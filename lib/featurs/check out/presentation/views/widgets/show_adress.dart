import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAdressWidget extends StatelessWidget {
  const ShowAdressWidget({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل :',
      child: Row(
        children: [
          Icon(Icons.pin_drop_outlined),
          SizedBox(width: 10),
          Text(
            context.read<OrderEntity>().shippingAddressEntity.toString(),
            textAlign: TextAlign.right,
            style: AppTextStyles.regular16.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(
                // go to address page to edit it
                1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Row(
              children: [
                Icon(Icons.edit_rounded, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'تعديل',
                  style: AppTextStyles.simibold13.copyWith(
                    color: const Color(0xFF949D9E),
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
