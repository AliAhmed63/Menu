import 'package:firebase_login_test/core/helper/extensions_route.dart';
import 'package:firebase_login_test/core/helper/firebase_auth.dart';
import 'package:firebase_login_test/core/helper/shred.dart';
import 'package:firebase_login_test/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  initState() {
    excuteNavigation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset('assets/images/splash_up.svg', fit: BoxFit.fill),
        Image.asset(
          'assets/images/menu.png',
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.18,
        ),
        SvgPicture.asset('assets/images/splash_down.svg', fit: BoxFit.fill),
      ],
    );
  }

  void excuteNavigation() {
    bool isOnBoardingSeen = Shareds.getBool(isOnBoardSeen);
    Future.delayed(const Duration(seconds: 4), () {
      context.pushReplacementNamed(onBoarding);
      // if (isOnBoardingSeen) {
      //   var isSignIn = FirebaseAuthService().isSignedIn();
      //   if (isSignIn) {
      //     Navigator.pushReplacementNamed(context, homeView);
      //   } else {
      //     Navigator.pushReplacementNamed(context, login);
      //   }
      // } else {
      //   Navigator.pushReplacementNamed(context, onBoarding);
      // }
    });
  }
}
