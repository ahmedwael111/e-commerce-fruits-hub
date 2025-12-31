part of 'signing_cubit.dart';

@immutable
sealed class SigningState {}

final class SigninInitial extends SigningState {}

final class SigninLoading extends SigningState {}

final class SigninSuccess extends SigningState {
  final UserEntity userEntity;
  SigninSuccess({required this.userEntity});
}

final class Signinfailure extends SigningState {
  final String message;
  Signinfailure({required this.message});
}


