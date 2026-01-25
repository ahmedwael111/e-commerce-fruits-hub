import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/search_product_cubit/search_product_cubit.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/helper_functions.dart/dummy_products.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/core/widgets/search_text_field.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_header_with_refresh.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_search_result_view_body_blocBuilder.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductSearchResultView extends StatelessWidget {
  const ProductSearchResultView({super.key, this.categoryName});
  final String? categoryName;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchProductCubit(getIt<ProductsRepo>()),
        ),
        BlocProvider(create: (context) => ProductsCubit(getIt<ProductsRepo>())),
      ],
      child: Scaffold(
        body: ProductSearchResultViewBodyBlocBuilder(
          categoryName: categoryName,
        ),
      ),
    );
  }
}
