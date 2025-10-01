import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class FeaturedListview extends StatelessWidget {
  const FeaturedListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(4, (index) => FeaturedItem())),
    );
  }
}
