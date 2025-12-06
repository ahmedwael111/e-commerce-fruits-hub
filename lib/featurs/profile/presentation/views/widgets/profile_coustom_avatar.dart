import 'package:e_commerce_fruits_hub/core/helper_functions.dart/get_user_data_from_prefs.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CoustomProfileAvatar extends StatelessWidget {
  const CoustomProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 93,
          height: 93,
          decoration: BoxDecoration(
            // color: Colors.red,
            border: Border.all(width: 13, color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset(
            getUserDataFromPrefs().imageUrl.isNotEmpty
                ? getUserDataFromPrefs().imageUrl
                : Assets.assetsProfile,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 30.5,
          left: 30.5,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(Assets.assetsCamera),
            ),
          ),
        ),
      ],
    );
  }
}
