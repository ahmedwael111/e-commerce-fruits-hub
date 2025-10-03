import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_notfication_widget.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

AppBar coustomAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: true,
    title: GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      },
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyles.bold19,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CoustomNotficationWidget(),
      ),
    ],
  );
}
