import 'package:e_commerce_fruits_hub/core/cubits/products/product_updates_cubit/product_updats_cubit_cubit.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/search_product_cubit/search_product_cubit.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/Main_view_body_with_bersistent_navBar.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/fav_user_orders_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fav_user_orders/fav_user_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // int selectedIndex = 0;
  // List<Widget> pages = const [
  //   HomeView(),
  //   ProductsView(),
  //   CardView(),
  //   ProfileView(),
  // ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),

          // this PersistentNavBar uses persistent_bottom_nav_bar package its handling the bottom nav bar and the page switching with state retention all in one widget
        ),
        BlocProvider(
          create: (context) => FavUserProductsCubit(getIt<FavUserOrdersRepo>()),
        ),
        BlocProvider(
          create: (context) => ProductUpdatsCubitCubit(getIt<ProductsRepo>()),
        ),
        BlocProvider(
          create: (context) => SearchProductCubit(getIt<ProductsRepo>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  FavUserProductsCubit(getIt<FavUserOrdersRepo>())
                    ..fetchFavUserProducts(),
        ),
      ],
      child: Scaffold(body: MainViewBodyWithPersistentNaveBar()),
    );
  }
}





// return BlocProvider(
//       create: (context) => CartCubit(),
//       child: Scaffold(
//         bottomNavigationBar: CoustomBottomNavBar(
//           selectedIndexCallback: (index) {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//         ),
//         body: SafeArea(
//           child: MainViewBody(selectedIndex: selectedIndex, pages: pages),
//         ),
//       ),
//     );