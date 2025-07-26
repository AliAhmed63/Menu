import 'package:firebase_login_test/core/helper/extensions_route.dart';
import 'package:firebase_login_test/core/helper/spacing.dart';
import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:firebase_login_test/core/utils/const.dart';
import 'package:firebase_login_test/core/widgets/custom_app_bar.dart';
import 'package:firebase_login_test/core/widgets/custom_botton.dart';
import 'package:firebase_login_test/core/widgets/custom_text_form_field.dart';
import 'package:firebase_login_test/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:firebase_login_test/features/auth/presentation/widgets/accept_terms_condation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late bool isTermAccepted = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String userName, email, password, phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(title: 'Create Account'),
              verticalSpace(16),
              Text(
                'Start your journey with Loqmet Beity easily! Create an account to enjoy delicious homemade dishes and track your orders. Complete the details below and be part of our community.',
                style: getRegularStyle(color: MyColors.black, fontSize: 14.sp),
              ),
              verticalSpace(16),
              CustomTextFormField(
                hintText: 'Full Name',
                prefixIcon: SvgPicture.asset('assets/images/personIcone.svg'),
                onSaved: (value) {
                  userName = value!;
                },
              ),
              verticalSpace(12),
              CustomTextFormField(
                hintText: 'Phone Number',
                prefixIcon: SvgPicture.asset('assets/images/phoneIcon.svg'),
                onSaved: (value) {
                  phoneNumber = value!;
                },
              ),
              verticalSpace(12),
              CustomTextFormField(
                hintText: 'Email Address',
                prefixIcon: SvgPicture.asset('assets/images/mailIcon.svg'),
                onSaved: (value) {
                  email = value!;
                },
              ),
              verticalSpace(12),
              CustomTextFormField(
                hintText: 'Password',
                prefixIcon: SvgPicture.asset('assets/images/lockIcon.svg'),
                onSaved: (value) {
                  password = value!;
                },
                obscureText: true,
                suffixIcon: Icons.remove_red_eye_outlined,
              ),
              verticalSpace(12),
              AcceptTermsCondation(
                onChecked: (bool value) {
                  isTermAccepted = value;
                },
              ),
              verticalSpace(24),
              CustomBotton(
                text: 'Create Account',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            userName,
                            phoneNumber,
                          );
                      print(phoneNumber.toString());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('You must accept the terms'),
                        ),
                      );
                    }
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              verticalSpace(18),
              GestureDetector(
                onTap: () {
                  context.pushNamed(login);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: getSemiBoldStyle(
                        color: MyColors.grayscale500,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      'Login',
                      style: getSemiBoldStyle(
                        color: MyColors.prime,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/popup_done.svg'),
            verticalSpace(20),
            Text(
              'Your account has been created successfully!',
              style: getBoldStyle(color: MyColors.black, fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            verticalSpace(10),
            Text(
              'Congratulations! Your account has been created successfully. You can now access the home page and explore delicious homemade meals.',
              style: getRegularStyle(
                color: MyColors.grayscale500,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(20),
            CustomBotton(text: 'Go to Home', onPressed: () {}, height: 45.h),
          ],
        ),
      );
    },
  );
}
