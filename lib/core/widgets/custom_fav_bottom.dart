import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fav_user_orders/fav_user_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavBottom extends StatefulWidget {
  const CustomFavBottom({
    super.key,
    required this.isFav,
    required this.product,
  });
  final bool isFav;
  final ProductEntity product;

  @override
  State<CustomFavBottom> createState() => _CustomFavBottomState();
}

class _CustomFavBottomState extends State<CustomFavBottom> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder:
          (Widget child, Animation<double> animation) =>
              ScaleTransition(scale: animation, child: child),

      duration: const Duration(milliseconds: 300),
      child: IconButton(
        onPressed: () {
          context.read<FavUserProductsEditsCubit>().toggleFav(
            widget.product,
            context,
          );
        },
        icon: Icon(
          widget.isFav ? Icons.favorite : Icons.favorite_border_rounded,
          color: widget.isFav ? Colors.red : Colors.grey,
          key: ValueKey<bool>(widget.isFav),
        ),
      ),
    );
  }
}
