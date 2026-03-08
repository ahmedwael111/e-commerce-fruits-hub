import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/cubits/signOut/signout_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/sginin_view.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/profile_list_view_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/how_are_view.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/log_out_widget.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/profile_list_tile.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/profile_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  // final BuildContext context1;
  @override
  Widget build(BuildContext context1) {
    return BlocConsumer<SignoutCubit, SignoutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
            context,
            screen: SigninView(),
            withNavBar: false,
            settings: RouteSettings(name: SigninView.routeName),
          );
        } else if (state is SignOutFailure) {
          snakBar(context, 'فشل تسجيل الخروج ❌');
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),

                child: Column(
                  children: [
                    coustomAppBar(
                      context: context,
                      title: 'حسابي',
                      showNotficationWidget: false,
                    ),
                    FractionallySizedBox(
                      widthFactor: 1.08,
                      child: ProfileListTile(),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text('عام', style: AppTextStyles.simibold13)],
                    ),
                    SizedBox(height: 16),
                    ProfileListView(
                      profileItem: profileListViewEntity(context),
                      // context1: context1,
                    ),
                    SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('المساعده', style: AppTextStyles.simibold13),
                      ],
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: HowAreView(),
                          withNavBar: true,
                        );
                      },
                      child: ProfileListViewItem(
                        profileItem: ProfileListViewEntity(
                          leading: Assets.assetsInfoCircle,
                          title: 'من نحن',
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Color(0xFFE8E8E8), thickness: 1),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 0),

              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    LogOutProfileWidget(),
                    SizedBox(height: 33),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
