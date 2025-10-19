import 'dart:io';

import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;
  final File imageFile;
  final String? imageUrl;
  final num expirationMonth;
  final bool isOrganic;
  final int numberOfCalorys;
  final num avrageRate = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.isFeatured,
    required this.imageFile,
    this.imageUrl,
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
      imageFile: map['imageFile'],
      imageUrl: map['imageUrl'],
      expirationMonth: map['expirationMonth'],
      isOrganic: map['isOrganic'],
      numberOfCalorys: map['numberOfCalorys'],
      unitAmount: map['unitAmount'],
      reviews: map['reviews'].map((e) => ReviewModel.fromMap(e)).toList(),
      sellingCount: map['sellingCount'],
    );
  }
  ProductEntity toEntity() {
    return ProductEntity( 
      name: name,
      description: description,
      price: price,
      code: code,
      isFeatured: isFeatured,
      imageFile: imageFile,
      imageUrl: imageUrl,
      expirationMonth: expirationMonth,
      isOrganic: isOrganic,
      numberOfCalorys: numberOfCalorys,
      unitAmount: unitAmount,
      // avrageRate: avrageRate,
      // ratingCount: ratingCount,
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
