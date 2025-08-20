import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';

import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coustomAppBar(context, 'تسجيل دخول'),
      body: LoginViewBody(),
    );
  }
}
