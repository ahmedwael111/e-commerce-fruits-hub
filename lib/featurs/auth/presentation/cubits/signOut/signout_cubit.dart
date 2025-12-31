import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'signout_state.dart';

class SignoutCubit extends Cubit<SignoutState> {
  SignoutCubit(this.authReop) : super(SignoutInitial());

  final AuthRepo authReop;
  Future<void> logout() async {
    try {
      emit(SignOutLoading());
      await authReop.logout();
      emit(SignOutSuccess());
    } on Exception catch (e) {
      log('Exception in SigninCubit.logout: ${e.toString()}');
      emit(SignOutFailure());
    }
  }
}
