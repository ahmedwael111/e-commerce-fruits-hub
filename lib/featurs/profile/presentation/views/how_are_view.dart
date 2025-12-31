import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/who_are_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/who_are_cubit/who_are_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/how_are_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HowAreView extends StatelessWidget {
  const HowAreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WhoAreCubit(getIt<WhoAreRepo>()),
      child: Scaffold(body: const HowAreViewBodyBlocBuilder()),
    );
  }
}
