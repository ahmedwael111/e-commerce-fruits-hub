import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/cubits/sginin/signin_cubit.dart';

import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/sginin_view_body.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/signinViewBody_blocConsumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coustomAppBar(context, 'تسجيل دخول'),
      body: BlocProvider(
        create: (context) => SigninCubit(getIt<AuthRepo>()),
        child: SgininViewBodyBlocConsumer(),
      ),
    );
  }
}
