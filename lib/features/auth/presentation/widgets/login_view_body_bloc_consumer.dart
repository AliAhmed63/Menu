import 'package:firebase_login_test/core/helper/extensions_route.dart';
import 'package:firebase_login_test/core/utils/const.dart';
import 'package:firebase_login_test/core/widgets/custom_progress_hud.dart';
import 'package:firebase_login_test/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:firebase_login_test/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          context.pushReplacementNamed(homeView);
        } else if (state is SigninFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SigninLoading ? true : false,
            child: LoginViewBody());
      },
    );
  }
}
