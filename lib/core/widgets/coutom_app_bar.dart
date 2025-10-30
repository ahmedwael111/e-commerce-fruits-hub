import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_notfication_widget.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

AppBar coustomAppBar( {required BuildContext context, required String title, bool showNotficationWidget = true , bool backButtonShow = false}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: Visibility(
      visible: backButtonShow,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
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
      Visibility(
        visible: showNotficationWidget,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CoustomNotficationWidget(),
        ),
      ),
    ],
  );
}
