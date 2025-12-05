import 'dart:io';

import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final double price;
  final String code;
  final bool isFeatured;
  final String? imageUrl;
  final num expirationMonth;
  final bool isOrganic;
  final int numberOfCalorys;
  final num avrageRate;
  final num ratingCount;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
    this.avrageRate = 0,
    this.ratingCount = 0,
    required this.isOrganic,
    required this.expirationMonth,
    required this.numberOfCalorys,
    required this.unitAmount,
    required this.sellingCount,
    this.reviews = const [],
  });
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      description: map['description'],
      price: map['price'],
      code: map['code'],
      isFeatured: map['isFeatured'],
      imageUrl: map['imageUrl'],
      expirationMonth: map['expirationMonth'],
      isOrganic: map['isOrganic'],
      numberOfCalorys: map['numberOfCalorys'],
      unitAmount: map['unitAmount'],
      reviews:
          (map['reviews'] as List<dynamic>)
              .map((e) => ReviewModel.fromMap(e))
              .toList(),
      sellingCount: map['sellingCount'] ?? 0,
      avrageRate: map['avrageRate'],
      ratingCount: map['ratingCount'],
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      sellingCount: sellingCount,
      name: name,
      description: description,
      price: price,
      code: code,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationMonth: expirationMonth,
      isOrganic: isOrganic,
      numberOfCalorys: numberOfCalorys,
      unitAmount: unitAmount,
      avrageRate: avrageRate,
      ratingCount: ratingCount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonth': expirationMonth,
      'isOrganic': isOrganic,
      'numberOfCalorys': numberOfCalorys,
      'unitAmount': unitAmount,
      'avrageRate': avrageRate,
      'ratingCount': ratingCount,
      'reviews': reviews.map((e) => e.toMap()).toList(),
    };
  }
}
