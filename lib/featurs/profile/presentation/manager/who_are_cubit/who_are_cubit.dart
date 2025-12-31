import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/who_are_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/who_are_repo.dart';
import 'package:equatable/equatable.dart';

part 'who_are_state.dart';

class WhoAreCubit extends Cubit<WhoAreState> {
  WhoAreCubit(this.whoAreYouRepo) : super(WhoAreInitial());
  WhoAreRepo whoAreYouRepo;
  Future getWhoAre() async {
    try {
      emit(WhoAreLoading());
      var data = await whoAreYouRepo.getHowAre();
      data.fold(
        (f) => emit(WhoArefaulier(errMessage: f.toString())),
        (r) => emit(WhoAreSuccess(whoAreEntity: r)),
      );
    } catch (e) {
      emit(WhoArefaulier(errMessage: e.toString()));
    }
  }
}
