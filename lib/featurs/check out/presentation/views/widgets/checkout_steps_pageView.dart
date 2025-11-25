import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/address_input_section.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/payment_section.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/shipping_section.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/steps_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({
    super.key,
    required this.pageController,
    required this.globalKey,
    this.autovalidateMode,
    required this.valueListenable,
  });
  final GlobalKey<FormState> globalKey;
  final PageController pageController;
  final AutovalidateMode? autovalidateMode;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getPages().length,
      itemBuilder: (context, index) {
        return getPages()[index];
      },
    );
  }

  List<Widget> getPages() {
    return [
      ShippingSection(),
      AddressInputSection(
        globalKey: globalKey,
        autovalidateMode: autovalidateMode,
        valueListenable: valueListenable,
      ),
      PaymentSection(pageController: pageController),
    ];
  }
}
