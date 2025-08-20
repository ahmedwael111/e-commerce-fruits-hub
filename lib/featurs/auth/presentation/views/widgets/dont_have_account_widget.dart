import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/signup_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "لا تمتلك حساب؟  ",
            style: AppTextStyles.simibold16.copyWith(
              color: const Color(0xFF949D9E) /* Grayscale-600 */,
            ),
          ),
          TextSpan(
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, SignupView.routeName);
                  },
            text: 'قم بإنشاء حساب',
            style: AppTextStyles.simibold16.copyWith(
              color: AppColors.primaryColor /* Grayscale-600 */,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
