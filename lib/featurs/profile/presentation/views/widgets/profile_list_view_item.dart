import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/profile_list_view_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fav_user_orders/fav_user_orders_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/favort_products_view.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/my_orders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileListViewItem extends StatelessWidget {
  const ProfileListViewItem({super.key, required this.profileItem});
  final ProfileListViewEntity profileItem;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.035,
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
  // final BuildContext context1;
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
                    return BlocProvider.value(
                      value: context.read<FavUserProductsCubit>(),
                      child: profilePages(context)[index],
                    );
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

List<Widget> profilePages(BuildContext context) {
  return [
    Placeholder(),
    MyOrdersView(),
    Placeholder(),
    FavorteProductsView(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];
}
