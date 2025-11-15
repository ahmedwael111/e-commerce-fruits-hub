import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coustom_divider.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/order_summary.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/payment_item.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/show_adress.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        OrderSummaryWidget(), // ملخص الطلب : i extract this becuse if i want to sent data to it
        SizedBox(height: 16),
        ShowAdressWidget(  pageController: pageController,), // عنوان التوصيل :
      ],
    );
  }
}
