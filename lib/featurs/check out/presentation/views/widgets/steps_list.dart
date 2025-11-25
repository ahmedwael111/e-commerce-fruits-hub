import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepsList extends StatelessWidget {
  const StepsList({
    super.key,
    required this.currentpage,
    required this.pageController, required this.ontap,
  });
  final int currentpage;
  final PageController pageController;
  final ValueChanged<int> ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              ontap(index);
            },
            child: StepItemSwitcher(
              isActive:
                  index <=
                  currentpage, // select page that i stand it and the previuse pages
              index: (index + 1).toString(),
              text: getSteps[index],
            ),
          ),
        );
      }),
    );
  }
}

List<String> getSteps = ['الشحن', 'العنوان', 'الدفع'];
