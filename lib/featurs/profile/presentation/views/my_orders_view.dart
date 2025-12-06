import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});
  static const String routeName = '/MyOrdersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const MyOrdersViewBody());
  }
}
