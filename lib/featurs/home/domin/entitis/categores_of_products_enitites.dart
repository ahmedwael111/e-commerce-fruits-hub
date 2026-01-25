import 'package:e_commerce_fruits_hub/core/utils/assets.dart';

class CategoriesOfProductsEntity {
  final String name;
  final String image;
  CategoriesOfProductsEntity({required this.name, required this.image});
}

List<CategoriesOfProductsEntity> categoriesOfProducts = [
  CategoriesOfProductsEntity(name: 'افوكادو', image: Assets.assetsAvocado),
  CategoriesOfProductsEntity(name: 'فراولة', image: Assets.assetsStropary),
  CategoriesOfProductsEntity(name: 'موز', image: Assets.assetsPnana),
  CategoriesOfProductsEntity(name: 'بطيخ', image: Assets.assetsWatermilon2),

  CategoriesOfProductsEntity(name: 'أناناس', image: Assets.assetsAnanass),
];
