import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.onTap,
    required this.isSelected,
  });
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),

        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),

          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ? ActiveSheppingItemDot() : InActiveSheppingItemDot(),
              SizedBox(width: 10),
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      title,
                      style: AppTextStyles.simibold13,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 6),
                  SizedBox(
                    width: 200,
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.regular13.copyWith(
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  '$price جنيه',
                  style: AppTextStyles.bold13.copyWith(
                    color: AppColors.lightprimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveSheppingItemDot extends StatelessWidget {
  const InActiveSheppingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFF949D9E) /* Grayscale-400 */,
          ),
        ),
      ),
    );
  }
}

class ActiveSheppingItemDot extends StatelessWidget {
  const ActiveSheppingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: const Color(0xFF1B5E37) /* Green1-500 */,
        shape: OvalBorder(side: BorderSide(width: 4, color: Colors.white)),
      ),
    );
  }
}
