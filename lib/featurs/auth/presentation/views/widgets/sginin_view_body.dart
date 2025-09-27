import 'dart:io';

import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coustom_form_textField.dart';
import 'package:e_commerce_fruits_hub/core/widgets/password_field.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/cubits/sginin/signin_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/or_divider.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/social_login_widget.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SgininViewBody extends StatefulWidget {
  const SgininViewBody({super.key});

  @override
  State<SgininViewBody> createState() => _SgininViewBodyState();
}

class _SgininViewBodyState extends State<SgininViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CoustomFormTextfield(
                onSaved: (p0) {
                  email = p0!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (p0) {
                  password = p0!;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: AppTextStyles.simibold13.copyWith(
                      color: AppColors.lightprimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CoustomBottom(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    BlocProvider.of<SigninCubit>(
                      context,
                    ).signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'تسجيل دخول',
              ),
              const SizedBox(height: 33),
              DontHaveAnAccountWidget(),
              const SizedBox(height: 37),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialLoginWidget(
                image: Assets.assetsGoogleLogo,
                title: 'تسجيل بواسطة جوجل',
                onPressed: () {
                  BlocProvider.of<SigninCubit>(context).signInWithGoogle();
                },
              ),
              const SizedBox(height: 16),
              Platform.isIOS
                  ? Column(
                    children: [
                      SocialLoginWidget(
                        image: Assets.assetsAppleLogo,
                        title: 'تسجيل بواسطة أبل',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 16),
                    ],
                  )
                  : const SizedBox(),
              SocialLoginWidget(
                image: Assets.assetsFacebookLogo,
                title: 'تسجيل بواسطة فيسبوك',
                onPressed: () {
                  BlocProvider.of<SigninCubit>(context).signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
