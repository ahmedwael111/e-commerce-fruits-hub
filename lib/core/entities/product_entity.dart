import 'dart:io';

import 'package:e_commerce_fruits_hub/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final num expirationMonth;
  final bool isOrganic;
  final int numberOfCalorys;
  final num avrageRate;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewEntity> reviews;
  final int sellingCount;

  ProductEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
    required this.isOrganic,
    required this.expirationMonth,
    required this.numberOfCalorys,
    required this.unitAmount,
    required this.sellingCount,
    required this.avrageRate,
    required this.ratingCount,
    this.reviews = const [],
  });
}
