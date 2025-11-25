import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/coustom_checkBox.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key, this.onChanged});
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CoustomCheckbox(onChanged: onChanged),
        SizedBox(width: 16),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.simibold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: AppTextStyles.simibold13.copyWith(
                    color: const Color(0xFF2D9F5D),
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: AppTextStyles.simibold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الخاصة بنا',
                  style: AppTextStyles.simibold13.copyWith(
                    color: const Color(0xFF2D9F5D),
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
