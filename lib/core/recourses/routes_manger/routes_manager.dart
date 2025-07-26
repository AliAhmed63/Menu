import 'package:firebase_login_test/core/utils/const.dart';
import 'package:firebase_login_test/features/auth/presentation/pages/login_view.dart';
import 'package:firebase_login_test/features/auth/presentation/pages/sigup_view.dart';
import 'package:firebase_login_test/features/auth/presentation/pages/terms_and_conditon.dart';
import 'package:firebase_login_test/features/cart/presentation/pages/cart_view.dart';
import 'package:firebase_login_test/features/home/presentation/pages/home_view.dart';
import 'package:firebase_login_test/features/on_boarding/presentation/pages/on_boarding_view.dart';
import 'package:firebase_login_test/features/splash/presentation/pages/splash_view.dart';
import 'package:flutter/material.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splash:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case onBoarding:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case login:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case singUp:
      return MaterialPageRoute(builder: (_) => const SigupView());

    case termAndCond:
      return MaterialPageRoute(builder: (_) => const TermsAndCondition());
    case homeView:
      return MaterialPageRoute(
        builder: (_) => HomeView(),
      );
    case cartView:
      return MaterialPageRoute(
        builder: (_) => const CartPage(),
      );
  }
  return null;
}
