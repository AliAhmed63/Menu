import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:firebase_login_test/core/recourses/value_manger/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    this.radius,
    required this.text,
    required this.onPressed,
    this.height,
    this.fontSize,
    this.width,
  });
  final String? text;
  final double? radius;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? AppSize.s16)),
        color: MyColors.prime,
      ),
      width: width ?? double.infinity,
      height: height ?? 60.h,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text ?? "",
          maxLines: 1,
          style: getBoldStyle(color: Colors.white, fontSize: fontSize ?? 16.sp),
        ),
      ),
    );
  }
}
