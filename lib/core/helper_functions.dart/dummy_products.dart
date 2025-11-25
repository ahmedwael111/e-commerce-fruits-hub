import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';

ProductEntity dummyProduct() {
  return ProductEntity(
    avrageRate: 0,
    ratingCount: 0,
    sellingCount: 0,
    name: 'dummyProduct',
    description: 'dummyProduct',
    price: 0,
    code: 'dummyProduct',
    isFeatured: false,
    imageUrl: null,
    expirationMonth: 0,
    isOrganic: false,
    numberOfCalorys: 0,
    unitAmount: 0,
    // avrageRate: 0,
    // ratingCount: 0,
    reviews: [],
  );
}

List<ProductEntity> dummyProducts() =>
    List.generate(10, (index) => dummyProduct());
