import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/who_are_cubit/who_are_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/how_are_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HowAreViewBodyBlocBuilder extends StatefulWidget {
  const HowAreViewBodyBlocBuilder({super.key});

  @override
  State<HowAreViewBodyBlocBuilder> createState() =>
      _HowAreViewBodyBlocBuilderState();
}

class _HowAreViewBodyBlocBuilderState extends State<HowAreViewBodyBlocBuilder> {
  @override
  void initState() {
    BlocProvider.of<WhoAreCubit>(context).getWhoAre();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WhoAreCubit, WhoAreState>(
      builder: (context, state) {
        if (state is WhoAreSuccess) {
          return HowAreViewBody(howAreText: state.whoAreEntity.whoAreText);
        } else if (state is WhoArefaulier) {
          return Center(child: Text(state.errMessage));
        } else {
          return Skeletonizer(
            enabled: true,
            child: HowAreViewBody(howAreText: kWhoAreDummyData),
          );
        }
      },
    );
  }
}
