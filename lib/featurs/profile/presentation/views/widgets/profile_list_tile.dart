import 'package:e_commerce_fruits_hub/core/helper_functions.dart/get_user_data_from_prefs.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/profile_coustom_avatar.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CoustomProfileAvatar(),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(getUserDataFromPrefs().name, style: AppTextStyles.bold13),
            SizedBox(height: 5),
            Text(
              getUserDataFromPrefs().email,
              style: AppTextStyles.regular13.copyWith(
                color: const Color(0xFF888FA0),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}
