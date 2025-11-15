import 'package:e_commerce_fruits_hub/core/widgets/coustom_divider.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CardItemList extends StatelessWidget {
  const CardItemList({super.key, required this.listOfCardItemEntity});
  final List<CardItemEntity>
  listOfCardItemEntity; // to be replaced with real data
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: listOfCardItemEntity.length,
      itemBuilder: (context, index) {
        return CardItem(cardItemEntity: listOfCardItemEntity[index]);
      },
      separatorBuilder: (context, index) => CoustomDivider(),
    );
  }
}
