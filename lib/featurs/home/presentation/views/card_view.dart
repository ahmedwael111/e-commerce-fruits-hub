import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/card_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider (
      create: (context) => CartItemCubit(),
      child: CardViewBody());
  }
}