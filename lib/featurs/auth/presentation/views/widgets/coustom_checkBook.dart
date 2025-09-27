import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoustomCheckbook extends StatefulWidget {
  const CoustomCheckbook({super.key, this.onChanged});
  final ValueChanged<bool>? onChanged;
  @override
  State<CoustomCheckbook> createState() => _CoustomCheckbookState();
}

class _CoustomCheckbookState extends State<CoustomCheckbook> {
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChanged?.call(isChecked);
        });
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked ? Colors.transparent : Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child:
            isChecked
                ? Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SvgPicture.asset(Assets.assetsCheck),
                )
                : SizedBox(),
      ),
    );
  }
}
