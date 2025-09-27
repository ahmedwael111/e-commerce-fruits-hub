part of 'signup_cubit_cubit.dart';

@immutable
sealed class SignupCubitState {}

final class SignupCubitInitial extends SignupCubitState {}

final class SignupCubitLoading extends SignupCubitState {}

final class SignupCubitSuccess extends SignupCubitState {
  final UserEntity userEntity;

  SignupCubitSuccess({required this.userEntity});

  @override
  String toString() => 'SignupCubitSuccess(user: $userEntity)';
}

final class SignupCubitfailure extends SignupCubitState {
  final String message;

  SignupCubitfailure({required this.message});

  @override
  String toString() => 'SignupCubitfailure(message: $message)';
}
