import 'package:e_commerce_fruits_hub/featurs/best_selling_fruit/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

static const String routeName = 'best-selling-view';
  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      body: BestSellingViewBody()
    );
  }
}