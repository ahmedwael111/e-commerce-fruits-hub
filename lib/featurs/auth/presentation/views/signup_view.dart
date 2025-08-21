import 'package:e_commerce_fruits_hub/core/services/firebase_auth_service.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/repos/auth_repo_implementation.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/cubits/signup/signup_cubit_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubitCubit(AuthRepoImplementation(
        firebaseAuthService: FirebaseAuthService(),
      )),
      child: Scaffold(
        appBar: coustomAppBar(context, 'حساب جديد'),
        body: SignupViewBody(),
      ),
    );
  }
}
