part of 'fav_user_orders_cubit.dart';

sealed class FavUserOrdersState extends Equatable {
  const FavUserOrdersState();

  @override
  List<Object> get props => [];
}

final class AddFavUserOrdersInitial extends FavUserOrdersState {}

final class AddFavUserOrdersloading extends FavUserOrdersState {}

final class AddFavUserOrdersSuccess extends FavUserOrdersState {}

final class AddFavUserOrdersFaulier extends FavUserOrdersState {
  final String errMessage;
  // ignore: prefer_const_constructors_in_immutables
  AddFavUserOrdersFaulier({required this.errMessage});
}

final class DeleteFavUserOrdersInitial extends FavUserOrdersState {}

final class DeleteFavUserOrdersloading extends FavUserOrdersState {}

final class DeleteFavUserOrdersSuccess extends FavUserOrdersState {}

final class DeleteFavUserOrdersFaulier extends FavUserOrdersState {
  final String errMessage;
  // ignore: prefer_const_constructors_in_immutables
  DeleteFavUserOrdersFaulier({required this.errMessage});
}


