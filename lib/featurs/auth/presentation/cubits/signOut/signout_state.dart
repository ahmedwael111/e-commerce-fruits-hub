part of 'signout_cubit.dart';

sealed class SignoutState extends Equatable {
  const SignoutState();

  @override
  List<Object> get props => [];
}

final class SignoutInitial extends SignoutState {}
final class SignOutLoading extends SignoutState {}

final class SignOutSuccess extends SignoutState {}

final class SignOutFailure extends SignoutState {}
