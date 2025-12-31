part of 'product_updats_cubit_cubit.dart';

sealed class ProductUpdatsCubitState extends Equatable {
  const ProductUpdatsCubitState();

  @override
  List<Object> get props => [];
}

final class ProductUpdatsCubitInitial extends ProductUpdatsCubitState {}

final class ProductUpdatsCubitLoading extends ProductUpdatsCubitState {}

final class ProductUpdatsCubitSuccess extends ProductUpdatsCubitState {
 
}

final class ProductUpdatsCubitFailure extends ProductUpdatsCubitState {
  final String errorMessage;
  const ProductUpdatsCubitFailure(this.errorMessage);
}
