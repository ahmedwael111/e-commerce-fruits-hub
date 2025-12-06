import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/persistent_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyWithPersistentNaveBar extends StatelessWidget {
  const MainViewBodyWithPersistentNaveBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
     listener: (context, state) {
        if (state is CartItemAdded) {
          snakBar(context, 'تم إضافة المنتج إلى السلة ');
        }
        if (state is CartItemRemoved) {
          snakBar(context, 'تم حذف المنتج من السلة ');
        }
      },
       child: SafeArea(child: PersistentNavBar())
    );
  }
}
