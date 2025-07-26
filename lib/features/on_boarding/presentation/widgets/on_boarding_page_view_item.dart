import 'package:firebase_login_test/core/helper/extensions_route.dart';
import 'package:firebase_login_test/core/helper/shred.dart';
import 'package:firebase_login_test/core/helper/spacing.dart';
import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:firebase_login_test/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class OnBoardingPageViewIteam extends StatelessWidget {
  const OnBoardingPageViewIteam({
    super.key,
    required this.background,
    required this.title,
    required this.isVisible,
    required this.cricterImage,
    required this.description,
    required this.width,
    required this.height,
  });

  final String background, title, cricterImage, description;
  final bool isVisible;
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              SvgPicture.asset(background, fit: BoxFit.fill, width: 390.w),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    Shareds.setBool(isOnBoardSeen, true);
                    context.pushReplacementNamed(login);
                  },
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 20,
                        top: 60,
                      ),
                      child: Text(
                        'Skip',
                        style: getSemiBoldStyle(
                          color: MyColors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SvgPicture.asset(cricterImage, fit: BoxFit.fill),
        verticalSpace(14),
        Text(
          title,
          textAlign: TextAlign.center,
          style: getBoldStyle(color: MyColors.grayscale500, fontSize: 18.sp),
        ),
        verticalSpace(10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: getRegularStyle(
            color: MyColors.grayscale500,
            fontSize: 14.sp,
          ).copyWith(height: 1.5),
        ),
      ],
    );
  }
}
