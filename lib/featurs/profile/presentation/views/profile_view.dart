import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/cubits/signOut/signout_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = '/profileView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignoutCubit(getIt<AuthRepo>())),
          BlocProvider(
            create: (context) => ProductsCubit(getIt<ProductsRepo>()),
          ),
          
        ],
        child: ProfileViewBody(),
      ),
    );
  }
}
