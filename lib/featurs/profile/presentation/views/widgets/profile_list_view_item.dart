import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/profile_list_view_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/my_orders_view.dart';
import 'package:flutter/material.dart';

class ProfileListViewItem extends StatelessWidget {
  const ProfileListViewItem({super.key, required this.profileItem});
  final ProfileListViewEntity profileItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Row(
        children: [
          Image.asset(profileItem.leading, scale: 1.5),
          const SizedBox(width: 7),
          Text(
            profileItem.title,
            style: AppTextStyles.simibold13.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          const Spacer(),
          profileItem.trailing,
        ],
      ),
    );
  }
}

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key, required this.profileItem});
  final List<ProfileListViewEntity> profileItem;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (itemContext, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (itemContext) {
                    return profilePages[index];
                  },
                ),
              );
            },
            child: ProfileListViewItem(profileItem: profileItem[index]),
          ),
      separatorBuilder:
          (itemContext, index) =>
              const Divider(color: Color(0xFFE8E8E8), thickness: 1),
      itemCount: profileItem.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

List<Widget> profilePages = [Placeholder(), MyOrdersView()];
