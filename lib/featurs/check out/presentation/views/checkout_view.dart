import 'package:e_commerce_fruits_hub/core/helper_functions.dart/get_user_data_from_prefs.dart';
import 'package:e_commerce_fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/shipping_address_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/manger/add_order/add_order_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/checkOut_viewBody_blocConsumer.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = '/checkout_view';
  final CartEntity
  cartEntity; // i use cart entity because its have List<CartItmeEntity> and methods of it dirictlly
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity = OrderEntity(
    // initialize order entity once because if i make hot reload initialize again will lose data
    widget.cartEntity,
    shippingAddressEntity: ShippingAddressEntity(),
    uId: getUserDataFromPrefs().id,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: coustomAppBar(
          context: context,
          title: 'الدفع',
          backButtonShow: true,
          showNotficationWidget: false,
        ),
        body: Provider.value(
          // useing provider insted inhirited widget : to provide 'orderEntity' to all widget tree without many passes
          value: orderEntity,
          child: CheckoutViewbodyBlocConsumer(
            child: CheckoutViewBody(),
          ), //  this way in refactor is easier in case 'nested widget'
        ),
      ),
    );
  }
}
