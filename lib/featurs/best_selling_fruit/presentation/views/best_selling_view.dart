import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/best_selling_fruit/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const String routeName = 'best-selling-view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductsCubit(getIt.get<ProductsRepo>())
                ..getBestSellingProducts(),
      child: Scaffold(
        appBar: coustomAppBar(
          context: context,
          title: 'الاكثر مبيعا',
          showNotficationWidget: true,
          backButtonShow: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            children: [
              SizedBox(height: 16),
              Expanded(child: BestSellingViewBodyBlocBuiler()),
            ],
          ),
        ),
      ),
    );
  }
}
