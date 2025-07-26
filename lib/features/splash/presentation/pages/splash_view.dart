import 'package:firebase_login_test/features/splash/presentation/widgets/splash_view_body.dart' show SplashViewBody;
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(),
    );
  }
}
