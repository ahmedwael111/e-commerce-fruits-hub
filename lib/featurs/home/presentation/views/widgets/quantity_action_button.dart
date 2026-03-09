import 'package:flutter/material.dart';

const double _actionButtonSize = 36;
const double _actionButtonRadius = 100;

/// Quantity action button (add/remove)
class QuantityActionButton extends StatelessWidget {
  const QuantityActionButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _actionButtonSize,
        height: _actionButtonSize,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_actionButtonRadius),
          ),
        ),
        child: Center(child: Icon(icon, color: iconColor, size: 28)),
      ),
    );
  }
}
