import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/checkout_view.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartBottom extends StatelessWidget {
  const CustomCartBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CoustomBottom(
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cardItems.isNotEmpty) {
              Navigator.pushNamed(context, CheckoutView.routeName ,
               arguments: context.read<CartCubit>().cartEntity);
            } else {
              snakBar(context, 'السلة فارغة');
            }
          },
          text:
              'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalCartPrice()} جنيه',
        );
      },
    );
  }
}
