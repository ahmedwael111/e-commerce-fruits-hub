part of 'fav_user_orders_cubit.dart';

abstract class FavUserProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavUserProductsInitial extends FavUserProductsState {}

class FavUserProductLoaded extends FavUserProductsState {
  final List<ProductEntity> products;

  FavUserProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class FavUserProuductsError extends FavUserProductsState {
  final String message;

  FavUserProuductsError(this.message);

  @override
  List<Object?> get props => [message];
}
