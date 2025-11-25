import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/shipping_item.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  // to keep the state of the page " very important"
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        SizedBox(height: 32),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
              context.read<OrderEntity>().isPayCash = true;
            });
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price:
              '${context.read<OrderEntity>().cartEntity.calculateTotalCartPrice().round() + 30}',
        ),
        SizedBox(height: 8),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
              context.read<OrderEntity>().isPayCash = false;
            });
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع الالكتروني',
          subtitle: 'يرجي تحديد طريقة الدفع',
          price:
              context
                  .read<OrderEntity>()
                  .cartEntity
                  .calculateTotalCartPrice()
                  .round()
                  .toString(),
        ),
        SizedBox(height: 100),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
