import 'package:firebase_login_test/core/helper/extensions_route.dart';
import 'package:firebase_login_test/core/utils/const.dart';
import 'package:firebase_login_test/core/widgets/custom_progress_hud.dart';
import 'package:firebase_login_test/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:firebase_login_test/features/auth/presentation/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          context.pushReplacementNamed(homeView);
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignupLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
