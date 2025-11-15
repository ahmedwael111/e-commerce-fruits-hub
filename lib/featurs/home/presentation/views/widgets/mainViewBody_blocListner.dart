import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({
    super.key,
    required this.selectedIndex,
    required this.pages,
  });

  final int selectedIndex;
  final List<Widget> pages;

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

      child: IndexedStack(
        // this widget builds all pages at once and shows only the selected one : it's solve the problem of losing state when switching between pages
        index: selectedIndex,
        children: pages,
      ),
    );
  }
}
