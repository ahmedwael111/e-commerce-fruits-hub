import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = '/profileView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coustomAppBar(
        context: context,
        title: 'حسابي',
        showNotficationWidget: false,
      ),
      body: ProfileViewBody(),
    );
  }
}
