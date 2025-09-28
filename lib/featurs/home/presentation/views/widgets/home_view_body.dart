import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [SliverToBoxAdapter(child: CoustomAppBar())],
    );
  }
}
