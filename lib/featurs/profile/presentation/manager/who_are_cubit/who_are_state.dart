// ignore_for_file: prefer_const_constructors_in_immutables

part of 'who_are_cubit.dart';

sealed class WhoAreState extends Equatable {
  const WhoAreState();

  @override
  List<Object> get props => [];
}

final class WhoAreInitial extends WhoAreState {}
final class WhoAreSuccess extends WhoAreState { 
  final WhoAreEntity whoAreEntity;
   WhoAreSuccess({required this.whoAreEntity});
}
final class WhoArefaulier extends WhoAreState { 
  final String errMessage;
   WhoArefaulier({required this.errMessage});
}
final class WhoAreLoading extends WhoAreState {}
