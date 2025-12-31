import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderViewBodyBlocBuilder extends StatefulWidget {
  const MyOrderViewBodyBlocBuilder({super.key});

  @override
  State<MyOrderViewBodyBlocBuilder> createState() =>
      _MyOrderViewBodyBlocBuilderState();
}

class _MyOrderViewBodyBlocBuilderState
    extends State<MyOrderViewBodyBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<FetchOrdersCubit>().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersFailure) {
          return Center(child: Text('حدث خطأ ما: ${state.errorMessage}'));
        } else if (state is FetchOrdersSuccess) {
          var orders = state.orders;
          return MyOrdersViewBody(orders: orders);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
