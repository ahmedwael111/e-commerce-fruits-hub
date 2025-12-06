import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/bottom_navBar_icon_entity.dart';
import 'package:e_commerce_fruits_hub/generated/l10n.dart';
import 'package:flutter/material.dart';

class CoustomBottomNavBar extends StatefulWidget {
  const CoustomBottomNavBar({super.key, required this.selectedIndexCallback});
  final ValueChanged<int> selectedIndexCallback;
  @override
  State<CoustomBottomNavBar> createState() => _CoustomBottomNavBarState();
}

class _CoustomBottomNavBarState extends State<CoustomBottomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 22,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            bottomNavbarIconList.asMap().entries.map((entry) {
              var index = entry.key;
              var value = entry.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    widget.selectedIndexCallback(selectedIndex);
                  });
                },
                child: Flexible(
                  child: WhichBottomNavBarIconSelected(
                    isSelected: selectedIndex == index,
                    bottomNavbarIconEntity: value,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class InActiveIcon extends StatelessWidget {
  const InActiveIcon({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      color: Colors.transparent,
      child: Image.asset(image, scale: 3),
    );
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 900),

      decoration: ShapeDecoration(
        color: const Color(0xFFEEEEEE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: ShapeDecoration(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(image),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhichBottomNavBarIconSelected extends StatefulWidget {
  const WhichBottomNavBarIconSelected({
    super.key,
    required this.isSelected,
    required this.bottomNavbarIconEntity,
  });
  final bool isSelected;
  final BottomNavbarIconEntity bottomNavbarIconEntity;

  @override
  State<WhichBottomNavBarIconSelected> createState() =>
      _WhichBottomNavBarIconSelectedState();
}

class _WhichBottomNavBarIconSelectedState
    extends State<WhichBottomNavBarIconSelected> {
  @override
  Widget build(BuildContext context) {
    return widget.isSelected
        ? ActiveIcon(
          image: widget.bottomNavbarIconEntity.activeIcon,
          text: widget.bottomNavbarIconEntity.name,
        )
        : InActiveIcon(image: widget.bottomNavbarIconEntity.inactiveIcon);
  }
}
