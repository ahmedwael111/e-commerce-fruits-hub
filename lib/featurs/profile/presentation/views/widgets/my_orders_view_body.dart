import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/order_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/order_item_accordion.dart';
import 'package:flutter/material.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key, required this.orders});
  final List<OrderEntityForOrderForOrders> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          coustomAppBar(
            context: context,
            title: 'طلباتي',
            showNotficationWidget: false,
            backButtonShow: true,
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderItemAccordion(
                  orderEntityForOrder: orders[index],
                  index: index, 
                  listLenght: orders.length, // to calculate somethings
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

