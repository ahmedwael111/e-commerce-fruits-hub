import 'package:flutter/material.dart';

const double _backButtonSize = 44;
const double _backButtonIconSize = 20;
const double _backButtonRadius = 50;
const Color _backButtonColor = Colors.white;
const Color _backButtonIconColor = Colors.black;

/// Back button widget
class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _backButtonSize,
        width: _backButtonSize,
        decoration: BoxDecoration(
          color: _backButtonColor,
          borderRadius: BorderRadius.circular(_backButtonRadius),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: _backButtonIconColor,
          size: _backButtonIconSize,
        ),
      ),
    );
  }
}
