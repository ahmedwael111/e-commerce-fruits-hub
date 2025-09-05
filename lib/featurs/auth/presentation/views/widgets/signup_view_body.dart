import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coustom_form_textField.dart';
import 'package:e_commerce_fruits_hub/core/widgets/password_field.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/cubits/signup/signup_cubit_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/have_an_account.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/widgets/terms_and_conditions_widget.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _SignupViewBodyState extends State<SignupViewBody> {
  late String email, password, name;
  late bool isTermsAndConditions = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CoustomFormTextfield(
                onSaved: (value) {
                  name = value!;
                },
                keyboardType: TextInputType.name,
                hintText: 'الاسم كامل',
              ),
              SizedBox(height: 16),
              CoustomFormTextfield(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAndConditions = value;
                },
              ),
              SizedBox(height: 30),
              CoustomBottom(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAndConditions) {
                      BlocProvider.of<SignupCubitCubit>(
                        context,
                      ).createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                        name: name,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('يجب الموافقة على الشروط والأحكام'),
                        ),
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              SizedBox(height: 26),
              HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
