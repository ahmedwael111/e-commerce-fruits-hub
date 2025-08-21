import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/entities/user_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'signup_cubit_state.dart';

class SignupCubitCubit extends Cubit<SignupCubitState> {
  SignupCubitCubit(this.authReop) : super(SignupCubitInitial());
   final AuthRepo authReop;
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupCubitLoading());
    final result = await authReop.creatUserEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignupCubitfailure(message: failure.errMessage)),
      (userEntity) => emit(SignupCubitSuccess(userEntity: userEntity)),
    );    
  }
}
