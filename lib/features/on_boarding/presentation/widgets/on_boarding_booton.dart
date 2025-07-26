import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/value_manger/value_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingBotton extends StatelessWidget {
  const OnBoardingBotton({
    super.key,
    this.radius,
    required this.onPressed,
    this.height,
    this.fontSize,
    this.width,
  });

  final double? radius;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius ?? AppSize.s12,
          ),
        ),
        color: MyColors.prime,
      ),
      width: width ?? double.infinity,
      height: height,
      child: TextButton(
          onPressed: onPressed,
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: MyColors.white,
          )),
    );
  }
}
