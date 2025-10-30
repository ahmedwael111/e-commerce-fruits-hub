import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/card_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CardViewBody extends StatelessWidget {
  const CardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
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
                CardItem(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
