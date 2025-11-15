import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_header.dart';

class ProductHeaderWithRefresh extends StatelessWidget { //refresh = use Watch Method to updata value
  const ProductHeaderWithRefresh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProductsHeader(
      resultsCount:
          context.watch<ProductsCubit>().allproductsLength,
    );
  }
}