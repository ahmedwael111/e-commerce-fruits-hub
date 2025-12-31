part of 'stream_for_fav_user_products_cubit.dart';

sealed class StreamForFavUserProductsState extends Equatable {
  const StreamForFavUserProductsState();

  @override
  List<Object> get props => [];
}

final class StreamForFavUserProductsInitial extends StreamForFavUserProductsState {}

final class StreamForFavUserProductsloading extends StreamForFavUserProductsState {}

final class StreamForFavUserProductsSuccess extends StreamForFavUserProductsState {
  final List<ProductEntity> products;

  StreamForFavUserProductsSuccess({required this.products});

}

final class StreamForFavUserProductsFaulier extends StreamForFavUserProductsState {
  final String errMessage;

  StreamForFavUserProductsFaulier({required this.errMessage});
}
