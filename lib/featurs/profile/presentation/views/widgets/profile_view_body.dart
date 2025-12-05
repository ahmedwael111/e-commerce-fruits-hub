import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileListTile(),
      ],
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CoustomProfileAvatar(),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text('أحمد ياسر', style: AppTextStyles.bold13),
              SizedBox(height: 5),
              Text(
                'mail@mail.com',
                style: AppTextStyles.regular13.copyWith(
                  color: const Color(0xFF888FA0),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

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
            color: Colors.red,
            border: Border.all(width: 13, color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset(Assets.assetsProfile),
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
