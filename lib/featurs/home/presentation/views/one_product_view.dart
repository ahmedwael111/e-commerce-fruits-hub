import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/one_product_view_body.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneProductView extends StatelessWidget {
  const OneProductView({
    super.key,
    required this.productEntity,
    this.cardItemEntity,
    required this.contextOfCubit,
  });
  final ProductEntity productEntity;
  final CardItemEntity? cardItemEntity;
  final BuildContext contextOfCubit;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartItemCubit()),
        BlocProvider.value(value: BlocProvider.of<CartCubit>(contextOfCubit)),
      ],
      child: Scaffold(
        body: OneProductViewBody(
          productEntity: productEntity,
          cardItemEntity: cardItemEntity,
        ),
      ),
    );
  }
}
