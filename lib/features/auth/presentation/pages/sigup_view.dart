import 'package:firebase_login_test/core/helper/get_it_service.dart';
import 'package:firebase_login_test/features/auth/domain/repositories/auth_repo.dart';
import 'package:firebase_login_test/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:firebase_login_test/features/auth/presentation/widgets/signup_veiw_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigupView extends StatelessWidget {
  const SigupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SafeArea(child: SignupViewBodyBlocConsumer()),
        ),
      ),
    );
  }
}
