import 'dart:developer';

import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/utils/paypal_constants.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/payment_pay_pal_entity/payment_pay_pal_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/manger/add_order/add_order_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/checkout_steps_pageView.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/step_item.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/steps_list.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController; // 1- state mangement of this page
  int currentPage = 0; // 2-
  late GlobalKey<FormState> globalKey = GlobalKey();
  ValueNotifier<AutovalidateMode> valueNotfier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  // AutovalidateMode? autovalidateMode2 = AutovalidateMode.disabled;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage =
            pageController.page!
                .toInt(); // 3- link this variable with controllar , i doing it because i will use variable befor controler selected
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotfier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create:
          (context) =>
              pageController, // provide page controller to all widget tree insted of passing it many times
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 16),
            StepsList(
              ontap: (index) { // we outing on tap out to control in it better by using methods directly in steps validation
                if (index == 0) {
                  pageController.animateToPage(
                    index, // move to next page from bottom only not by stroll horizontal
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                } else if (index == 1) {
                  if (context.read<OrderEntity>().isPayCash != null) {
                    pageController.animateToPage(
                      index, // move to next page from bottom only not by stroll horizontal
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  } else {
                    snakBar(context, ' يرجي تحديد طريقة الدفع');
                  }
                } else {
                  validateAddressSection();
                }
              },
              pageController:
                  pageController, // becuse control in pages and navigate by steps list
              currentpage: currentPage,
            ),
            SizedBox(height: 24),
            Expanded(
              child: CheckOutStepsPageView(
                valueListenable: valueNotfier,
                // autovalidateMode: autovalidateMode2,
                pageController: pageController,
                globalKey: globalKey,
              ),
            ),
            CoustomBottom(
              onPressed: () {
                if (currentPage == 0) {
                  validateShippingSection(context);
                } else if (currentPage == 1) {
                  validateAddressSection();
                } else {
                  // var orderEntity = context.read<OrderEntity>();
                  // context.read<AddOrderCubit>().addOrder(orderEntity);
                  peymentWithPaypal(context);
                }
              },
              text: getTexts(currentPage),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void validateAddressSection() {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    } else {
      valueNotfier.value = AutovalidateMode.always;
      setState(() {});
    }
  }

  void validateShippingSection(BuildContext context) {
    if (context.read<OrderEntity>().isPayCash != null) {
      pageController.animateToPage(
        currentPage +
            1, // move to next page from bottom only not by stroll horizontal
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    } else {
      snakBar(context, ' يرجي تحديد طريقة الدفع');
    }
  }

  void peymentWithPaypal(BuildContext context) {
    PaymentPayPalEntity paymentPayPalEntity = PaymentPayPalEntity.fromEntity(
      context.read<OrderEntity>(),
    );
    // convert orderEntity to paymentPayPalEntity
    log(
      paymentPayPalEntity.toJson().toString(),
    ); // to show it in console befor send to paypal
    var orderEntity = context.read<OrderEntity>();
    var addOrderCubit =
        context
            .read<
              AddOrderCubit
            >(); // get cubit before the next page and new context .

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: PaypalConstants.kClientId,
              secretKey: PaypalConstants.kSecretKey,
              transactions: [
                paymentPayPalEntity
                    .toJson(), // convert paymentPayPalEntity to json and send to paypal
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log('onSuccess: $params');
                Navigator.pop(context);
                await addOrderCubit.addOrder(
                  orderEntity,
                ); // add order to database after payment success
                snakBar(context, 'تم الدفع بنجاح');
              },
              onError: (error) {
                Navigator.pop(context);
                log(error.toString());
                snakBar(context, 'حدث خطأ في الدفع');
              },
              onCancel: () {
                print('cancelled:');
              },
            ),
      ),
    );
  }
}

String getTexts(int currentPage) {
  // change the button text according to the current page
  switch (currentPage) {
    case 0:
      return 'التالي';
    case 1:
      return 'التالي';
    case 2:
      return 'الدفع عبر PayPal';
    default:
      return 'التالي';
  }
}
