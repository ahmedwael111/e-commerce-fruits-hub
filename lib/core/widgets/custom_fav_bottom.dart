import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fav_user_orders/fav_user_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavBottom extends StatelessWidget {
  const CustomFavBottom({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final favCubit = context.watch<FavUserProductsCubit>();
    final isFav = favCubit.isFavorite(product.productId);
    return IconButton(  
      icon: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: isFav ? Colors.red : Colors.black45,
      ),
      onPressed: () {
        context.read<FavUserProductsCubit>().toggleFav(product);
      },
    );
  }
}
 // 1) كده فاضل اراجع الموضوع اتعمل ازاي بالظبك من شات  واركز ✅
//  2) اشوف الحاجات اللي فاضله  ✅
//  3) ااراجع علي كل حاجه في الكورس والمشروع 
//  4) انشر المشروع علي لينكد ان 
//  5) هنشوف اللي اللي بعد كده
//        الله المستعان