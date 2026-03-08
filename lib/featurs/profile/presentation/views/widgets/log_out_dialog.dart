 import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/presentation/cubits/signOut/signout_cubit.dart' show SignoutCubit;

Future<dynamic> logOutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (dialogcontext) {
          // Use dialogcontext here
          return BlocProvider.value(
            value:
                context
                    .read<
                      SignoutCubit
                    >(), // Provide the existing SignoutCubit because dialogcontext is different
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Icon(Icons.cancel_rounded)],
              ),
              content: Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 16,
                  right: 16,
                  bottom: 12,
                ),
                child: const Text(
                  'هل ترغب في تسجيل الخروج ؟',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold16,
                ),
              ),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.read<SignoutCubit>().logout();
                          Navigator.of(dialogcontext).pop();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'تأكيد',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bold16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(dialogcontext).pop();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'لا ارغب',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bold16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
  }

