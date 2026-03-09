import 'package:flutter/material.dart';

import 'organics_item_info_column.dart';

const double _organicsItemBorderRadius = 16;
const double _organicsItemBorderWidth = 1;
const Color _organicsItemBorderColor = Color(0xFFF1F1F5);

class OrganicsItem extends StatelessWidget {
  const OrganicsItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 4, right: 4, bottom: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: _organicsItemBorderWidth,
            color: _organicsItemBorderColor,
          ),
          borderRadius: BorderRadius.circular(_organicsItemBorderRadius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              OrganicsItemInfoColumn(title: title, subTitle: subTitle),
              Image.asset(image, scale: 2),
            ],
          ),
        ],
      ),
    );
  }
}
