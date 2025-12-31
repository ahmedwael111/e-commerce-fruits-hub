import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/view_orders_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/my_order_view_body_bloc_consucmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});
  static const String routeName = '/MyOrdersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocProvider ( 
      create: (context) => FetchOrdersCubit( 
          getIt<ViewOrdersRepo>()),
          child:  const MyOrderViewBodyBlocBuilder()),
      );
       
  }
}
