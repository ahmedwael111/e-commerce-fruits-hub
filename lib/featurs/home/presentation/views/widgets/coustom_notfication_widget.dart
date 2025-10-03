import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CoustomNotficationWidget extends StatelessWidget {
  const CoustomNotficationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: ShapeDecoration(
        color: const Color(0xFFEEF8ED) /* green-50 */,
        shape: OvalBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(Assets.assetsNotification1),
      ),
    );
  }
}
