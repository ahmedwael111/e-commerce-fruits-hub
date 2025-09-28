import 'package:e_commerce_fruits_hub/core/widgets/coustom_progress_indicator.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/cubits/signup/signup_cubit_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubitCubit, SignupCubitState>(
      listener: (context, state) {
        if (state is SignupCubitSuccess) {
          snakBar(context, 'تم إنشاء الحساب بنجاح ✅');
          Navigator.pop(context);
        } else if (state is SignupCubitfailure) {
          // Handle failure, e.g., show an error message
          snakBar(context, '${state.message} ❌');
        }
      },
      builder: (context, state) {
        return CoustomProgressIndicator(
          isLoad: state is SignupCubitLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
