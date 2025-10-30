import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/helper_functions.dart/dummy_products.dart';
import 'package:e_commerce_fruits_hub/core/widgets/failuer_message.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridview(products: state.products);
        }
        if (state is Productsfailure) {
          return SliverToBoxAdapter(
            child: FailuerMessage(errorMessage: state.errorMessage),
          );
        }
        return Skeletonizer.sliver(
          child: ProductsGridview(products: dummyProducts()),
        );
      },
    );
  }
}
