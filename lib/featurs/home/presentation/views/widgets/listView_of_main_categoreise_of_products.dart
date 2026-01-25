import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/categores_of_products_enitites.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/our_products_item.dart';
import 'package:flutter/material.dart';

class ListViewOfMainCategriesOfProducts extends StatelessWidget {
  const ListViewOfMainCategriesOfProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesOfProducts.length,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.only(left: 9),
              child: OurProductsItem(category: categoriesOfProducts[index]),
            ),
      ),
    );
  }
}
