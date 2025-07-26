import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:firebase_login_test/core/recourses/value_manger/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, this.title, this.fontSize, this.onPressed});

  final String? title;
  final double? fontSize;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: MyColors.white,
      centerTitle: true,
      title: Text(
        title ?? "تسجيل الدخول",
        style: getBoldStyle(color: MyColors.black, fontSize: 20.sp),
      ),
      leading: onPressed == null
          ? null
          : IconButton(
              onPressed: onPressed,
              icon: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.grayscale150,
                      offset: const Offset(2, 5),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: MyColors.black,
                  size: 18.sp,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
