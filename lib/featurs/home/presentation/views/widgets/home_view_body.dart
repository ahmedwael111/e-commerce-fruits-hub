import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/widgets/search_text_field.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/best_seeling_gridview.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/best_seller_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/featured_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getBestSellingProducts();
  }

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
                CoustomAppBar(),
                const SizedBox(height: 24),
                SearchTextfield(),
                const SizedBox(height: 24),
                AspectRatio(aspectRatio: 342 / 158, child: FeaturedListview()),
                const SizedBox(height: 12),
                BestSellerHeader(),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: BestSeelingGridview(),
        ),
      ],
    );
  }
}
