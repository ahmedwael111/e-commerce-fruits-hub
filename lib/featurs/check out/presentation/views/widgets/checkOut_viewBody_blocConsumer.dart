import 'package:e_commerce_fruits_hub/core/widgets/coustom_progress_indicator.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/manger/add_order/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutViewbodyBlocConsumer extends StatelessWidget {
  // this method to refactor code and its more readable when use nested widget above child
  const CheckoutViewbodyBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          snakBar(context, 'تم تسجيل الطلب بنجاح ✅ ');
        } else if (state is AddOrderFailure) {
          snakBar(context, state.errMessage.toString());
        }
      },
      builder: (context, state) {
        return CoustomProgressIndicatorHud(
          isLoad: state is AddOrderLoading ? true : false,
          child: child,
        );
      },
    );
  }
}
