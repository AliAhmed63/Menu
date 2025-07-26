import 'package:firebase_login_test/core/helper/extensions_route.dart';
import 'package:firebase_login_test/core/helper/spacing.dart';
import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:firebase_login_test/core/utils/const.dart';
import 'package:firebase_login_test/core/widgets/custom_app_bar.dart';
import 'package:firebase_login_test/core/widgets/custom_botton.dart';
import 'package:firebase_login_test/core/widgets/custom_text_form_field.dart';
import 'package:firebase_login_test/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:firebase_login_test/features/auth/presentation/widgets/custom_socail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late bool isTermAccepted = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(title: 'Login'),
              verticalSpace(18),
              SvgPicture.asset('assets/images/login.svg'),
              verticalSpace(13),
              CustomTextFormField(
                hintText: 'Email Address',
                prefixIcon: SvgPicture.asset('assets/images/mailIcon.svg'),
                onSaved: (value) {
                  email = value!;
                },
              ),
              verticalSpace(15),
              CustomTextFormField(
                hintText: 'Password',
                prefixIcon: SvgPicture.asset('assets/images/lockIcon.svg'),
                obscureText: true,
                onSaved: (value) {
                  password = value!;
                },
                suffixIcon: Icons.remove_red_eye_outlined,
              ),
              verticalSpace(18),
              // RememberMe(
              //   onChecked: (bool value) {
              //     isTermAccepted = value;
              //   },
              //   text: Text(
              //     'Remember Me',
              //     style: getRegularStyle(
              //       color: MyColors.grayscale400,
              //       fontSize: 15.sp,
              //     ),
              //   ),
              // ),
              // verticalSpace(24),
              CustomBotton(
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // if (isTermAccepted) {
                    context.read<SigninCubit>().signInWithEmailAndPassword(
                      email,
                      password,
                    );
                    // } else {
                    //   buildErrorBar(context, 'You must accept the terms');
                    // }
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              verticalSpace(16),
              CustomSocialCard(
                onTapGoogle: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                // onTapFace: () {
                //   context.read<SigninCubit>().signInWithFacebook();
                // },
                // onTapApple: () {},
              ),
              verticalSpace(16),
              GestureDetector(
                onTap: () {
                  context.pushNamed(singUp);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: getSemiBoldStyle(
                        color: MyColors.grayscale500,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      'Sign up now',
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
