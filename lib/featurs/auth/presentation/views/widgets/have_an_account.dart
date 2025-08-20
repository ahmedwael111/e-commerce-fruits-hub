import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟ ',
            style: AppTextStyles.simibold16.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          TextSpan(
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
    
            text: 'تسجيل دخول',
            style: AppTextStyles.simibold16.copyWith(
              color: const Color(0xFF1B5E37) /* Green1-500 */,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.right,
    );
  }
}
