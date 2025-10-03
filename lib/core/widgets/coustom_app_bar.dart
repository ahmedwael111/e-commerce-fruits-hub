import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_notfication_widget.dart';
import 'package:flutter/material.dart';

AppBar coustomAppBar() {
    return AppBar(
      title: const Text(
        'الأكثر مبيعًا',
        textAlign: TextAlign.center,
        style: AppTextStyles.bold19,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CoustomNotficationWidget(),
        ),
      ],
    );
  }