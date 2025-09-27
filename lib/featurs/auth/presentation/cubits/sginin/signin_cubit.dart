import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authReop) : super(SigninInitial());
  final AuthRepo authReop;
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    final result = await authReop.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(Signinfailure(message: failure.errMessage)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authReop.signInWithGoogle();
    result.fold(
      (failure) => emit(Signinfailure(message: failure.errMessage)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final result = await authReop.signInWithFacebook();
    result.fold(
      (failure) => emit(Signinfailure(message: failure.errMessage)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }
}
