import 'package:e_commerce_fruits_hub/core/widgets/coustom_progress_indicator.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/cubits/sginin/signin_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/sginin_view_body.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SgininViewBodyBlocConsumer extends StatelessWidget {
  const SgininViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          snakBar(context, 'تم تسجيل الدخول بنجاح ✅');
          Navigator.pushNamed(context, MainView.routeName);
        } else if (state is Signinfailure) {
          // Handle failure, e.g., show an error message
          snakBar(context, '${state.message} ❌');
        }
      },
      builder:
          (context, state) => CoustomProgressIndicator(
            isLoad: state is SigninLoading ? true : false,
            child: const SgininViewBody(),
          ),
    );
  }
}
