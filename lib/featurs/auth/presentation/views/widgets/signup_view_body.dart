import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coustom_form_textField.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/have_an_account.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/terms_and_conditions_widget.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),
            CoustomFormTextfield(
              keyboardType: TextInputType.name,
              hintText: 'الاسم كامل',
            ),
            SizedBox(height: 16),
            CoustomFormTextfield(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CoustomFormTextfield(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.visibility_rounded),
            ),
            SizedBox(height: 16),
            TermsAndConditionsWidget(),
            SizedBox(height: 30),
            CoustomBottom(text: 'إنشاء حساب جديد', onPressed: () {}),
            SizedBox(height: 26),
            HaveAnAccount(),
          ],
        ),
      ),
    );
  }
}

