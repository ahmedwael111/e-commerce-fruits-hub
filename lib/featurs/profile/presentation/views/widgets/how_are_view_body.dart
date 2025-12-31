import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:flutter/material.dart';

class HowAreViewBody extends StatelessWidget {
  const HowAreViewBody({super.key, required this.howAreText});
  final String howAreText;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: 16),
                coustomAppBar(
                  context: context,
                  title: 'من نحن',
                  backButtonShow: true,
                  showNotficationWidget: false,
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x337090B0),
                        blurRadius: 40,
                        offset: Offset(0, 16),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(19),
                    child: Column(
                      children: [
                        Text(
                          howAreText,
                          textAlign: TextAlign.justify,
                          style: AppTextStyles.simibold16.copyWith(
                            color: const Color(0xFF4E5556),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
