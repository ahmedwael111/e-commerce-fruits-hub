import 'package:e_commerce_fruits_hub/featurs/auth/presentation/cubits/signup/signup_cubit_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubitCubit, SignupCubitState>(
      listener: (context, state) {
        if (state is SignupCubitSuccess) {
          snakBar(context, 'تم إنشاء الحساب بنجاح ✅');
        } else if (state is SignupCubitfailure) {
          // Handle failure, e.g., show an error message
          snakBar(context, '${state.message} ❌');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupCubitLoading ? true : false,
          child: SignupViewBody(),
        );
      },
    );
  }

  void snakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
