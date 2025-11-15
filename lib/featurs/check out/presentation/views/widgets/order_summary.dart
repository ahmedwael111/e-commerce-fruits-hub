import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppTextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556) /* Grayscale-950 */,
                ),
              ),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalCartPrice().round()} جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyles.simibold16,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: 52,
                child: Text(
                  'التوصيل:',
                  style: AppTextStyles.regular13.copyWith(
                    color: const Color(0xFF4E5556),
                  ),
                ),
              ),
              Spacer(),
              Text(
                '40 جنية',
                textAlign: TextAlign.right,
                style: AppTextStyles.simibold13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(indent: 32, endIndent: 32, color: const Color(0xFFCACECE)),
          SizedBox(height: 8),
          Row(
            children: [
              Text('الكلي', style: AppTextStyles.bold16),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalCartPrice().round() + 40} جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
