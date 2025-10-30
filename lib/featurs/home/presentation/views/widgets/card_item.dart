import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/core/widgets/cached_netwok_image.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/action_bottons_ofCardItem.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomNetworkImage(imageUrl: "https://placehold.co/53x40"),
            ),
          ),
          SizedBox(width: 17),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('بطيخ', style: AppTextStyles.bold13),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(Assets.assetsTrash, scale: 3),
                    ),
                  ],
                ),

                Text(
                  '3 كم',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.regular13.copyWith(
                    color: const Color(0xFFF4A91F),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    ActionBottonsOfcarditem(),
                    Spacer(),
                    Text(
                      '60 جنيه',
                      style: AppTextStyles.bold16.copyWith(
                        color: const Color(0xFFF4A91F),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
