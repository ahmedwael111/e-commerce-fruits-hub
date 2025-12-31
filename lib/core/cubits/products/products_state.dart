part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class Productsloading extends ProductsState {}

final class Productsfailure extends ProductsState {
  final String errorMessage;
  Productsfailure(this.errorMessage);
}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  ProductsSuccess(this.products);
}
final class UpdateProductsInitial extends ProductsState {}

final class UpdateProductsloading extends ProductsState {}

final class UpdateProductsfailure extends ProductsState {
  final String errorMessage;
  UpdateProductsfailure(this.errorMessage);
}

final class UpdateProductsSuccess extends ProductsState {
  
}
