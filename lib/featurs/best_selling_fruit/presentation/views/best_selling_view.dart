import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/best_selling_fruit/presentation/views/widgets/best_selling_view_body.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_notfication_widget.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const String routeName = 'best-selling-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coustomAppBar(
        context: context,
        title: 'الاكثر مبيعا',
        showNotficationWidget: true,
        backButtonShow: true,
      ),
      body: BestSellingViewBody(),
    );
  }
}
