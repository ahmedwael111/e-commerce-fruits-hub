import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class BestSeelingGridview extends StatelessWidget {
  const BestSeelingGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 225,
      ),
      itemBuilder: (context, index) => const FruitItem(),
      itemCount: 20,
    );
  }
}
