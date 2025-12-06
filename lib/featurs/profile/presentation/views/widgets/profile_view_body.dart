import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/profile_list_view_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/log_out_widget.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/profile_list_tile.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/profile_list_view_item.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          FractionallySizedBox(widthFactor: 1.08, child: ProfileListTile()),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('عام', style: AppTextStyles.simibold13)],
          ),
          SizedBox(height: 16),
          ProfileListView(profileItem: profileListViewEntity),
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('المساعده', style: AppTextStyles.simibold13)],
          ),
          SizedBox(height: 16),
          ProfileListViewItem(
            profileItem: ProfileListViewEntity(
              leading: Assets.assetsInfoCircle,
              title: 'من نحن',
              trailing: const Icon(Icons.arrow_forward_ios, size: 22),
            ),
          ),
          Divider(color: Color(0xFFE8E8E8), thickness: 1),
          const Spacer(),
          FractionallySizedBox(widthFactor: 1.08, child: LogOutProfileWidget()),
          SizedBox(height: 33),
        ],
      ),
    );
  }
}


