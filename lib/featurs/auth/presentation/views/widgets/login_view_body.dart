import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coustom_form_textField.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/or_divider.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/social_login_widget.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CoustomFormTextfield(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CoustomFormTextfield(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.visibility_rounded),
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
            CoustomBottom(onPressed: () {}, text: 'تسجيل دخول'),
            const SizedBox(height: 33),
            DontHaveAnAccountWidget(),
            const SizedBox(height: 37),
            const OrDivider(),
            const SizedBox(height: 16),
            SocialLoginWidget(
              image: Assets.assetsGoogleLogo,
              title: 'تسجيل بواسطة جوجل',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            SocialLoginWidget(
              image: Assets.assetsAppleLogo,
              title: 'تسجيل بواسطة أبل',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            SocialLoginWidget(
              image: Assets.assetsFacebookLogo,
              title: 'تسجيل بواسطة فيسبوك',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
