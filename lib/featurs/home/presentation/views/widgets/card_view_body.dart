import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coustom_divider.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/card_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/card_item_list.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/custom_cart_bottom.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardViewBody extends StatelessWidget {
  const CardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    coustomAppBar(
                      context: context,
                      title: 'السلة',
                      backButtonShow: true,
                      showNotficationWidget: false,
                    ),
                    const SizedBox(height: 24),
                    FractionallySizedBox(widthFactor: 1.5, child: CardHeader()),
                    // this widget to avoid the horizontal padding of the parent
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:
                  context.read<CartCubit>().cartEntity.cardItems.isEmpty
                      ? null
                      : CoustomDivider(),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              sliver: CardItemList(
                listOfCardItemEntity:
                    context.watch<CartCubit>().cartEntity.cardItems,
              ),
            ),
            SliverToBoxAdapter(
              child:
                  context.read<CartCubit>().cartEntity.cardItems.isEmpty
                      ? null
                      : CoustomDivider(),
            ),
          ],
        ),
        Positioned(right: 16, left: 16, bottom: 60, child: CustomCartBottom()),
      ],
    );
  }
}
