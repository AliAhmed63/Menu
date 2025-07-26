import 'package:firebase_login_test/core/helper/get_it_service.dart';
import 'package:firebase_login_test/features/auth/domain/repositories/auth_repo.dart';
import 'package:firebase_login_test/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:firebase_login_test/features/auth/presentation/widgets/login_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthRepo>(),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const Scaffold(
          body: SafeArea(child: SigninViewBodyBlocConsumer()),
        ),
      ),
    );
  }
}
