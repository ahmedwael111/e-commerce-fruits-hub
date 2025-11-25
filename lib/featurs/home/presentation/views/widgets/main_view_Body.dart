import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/mainViewBody_blocListner.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.selectedIndex,
    required this.pages,
  });

  final int selectedIndex;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return MainViewBodyBlocListener(selectedIndex: selectedIndex, pages: pages);
  }
}
