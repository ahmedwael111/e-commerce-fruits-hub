import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:flutter/material.dart';

import 'organics_item.dart';

const double _itemSpacing = 20;

/// Product Specifications Section containing expiration, organic, calories, and rating
class ProductSpecificationsSection extends StatelessWidget {
  const ProductSpecificationsSection({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OrganicsItem(
                image: Assets.assetsCalendar,
                title: ' ${productEntity.expirationMonth} شهر.',
                subTitle: 'الصلاحيه',
              ),
            ),
            const SizedBox(width: _itemSpacing),
            Expanded(
              child: OrganicsItem(
                image: Assets.assetsOrganic,
                title: productEntity.isOrganic ? '100%' : '0%',
                subTitle: 'ارجانيك',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OrganicsItem(
                image: Assets.assetsCaloris,
                title: '${productEntity.numberOfCalorys} كالوريا',
                subTitle: '100 جرام',
              ),
            ),
            const SizedBox(width: _itemSpacing),
            Expanded(
              child: OrganicsItem(
                image: Assets.assetsStar,
                title:
                    '${productEntity.avrageRate} (${productEntity.ratingCount})',
                subTitle: 'Reviews',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
