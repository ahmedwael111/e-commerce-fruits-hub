import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class StepItemSwitcher extends StatelessWidget {
  const StepItemSwitcher({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
  });
  final String text, index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: ActiveStepItem(stepTitle: text),
      secondChild: InActiveStepItem(stepTitle: text, stepNumper: index),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
    );
  }
}

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.stepTitle});
  final String stepTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 23,
          height: 23,
          decoration: ShapeDecoration(
            color: const Color(0xFF1B5E37) /* Green1-500 */,
            shape: OvalBorder(),
          ),
          child: const Center(
            child: Icon(Icons.check, color: Colors.white, size: 16),
          ),
        ),
        SizedBox(width: 4),
        Text(
          stepTitle,
          style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({
    super.key,
    required this.stepTitle,
    required this.stepNumper,
  });
  final String stepTitle;
  final String stepNumper;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: ShapeDecoration(
            color: const Color(0xFFF2F3F3) /* Green1-500 */,
            shape: OvalBorder(),
          ),
          child: Center(child: Text(stepNumper, style: AppTextStyles.bold13)),
        ),
        SizedBox(width: 4),
        Text(
          stepTitle,
          style: AppTextStyles.simibold13.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}
