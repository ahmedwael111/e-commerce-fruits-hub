import 'package:e_commerce_fruits_hub/core/helper_functions.dart/get_user_data_from_prefs.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_notfication_widget.dart';
import 'package:flutter/material.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          'صباح الخير !..',
          textAlign: TextAlign.right,
          style: AppTextStyles.regular16.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
        subtitle: Text(
          getUserDataFromPrefs().name, // get user name from local prefs
          textAlign: TextAlign.right,
          style: AppTextStyles.bold16.copyWith(color: Colors.black),
        ),
        trailing: CoustomNotficationWidget(),
        leading: Padding(
          padding: const EdgeInsets.all(3),
          child: Image.asset(Assets.assetsProfile),
        ),
      ),
    );
  }
}
