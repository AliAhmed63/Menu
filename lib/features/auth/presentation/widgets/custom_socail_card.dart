import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class CustomSocialCard extends StatelessWidget {
  CustomSocialCard({
    super.key,
    required this.onTapGoogle,
    // required this.onTapFace,
    // required this.onTapApple,
  });
  void Function()? onTapGoogle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // GestureDetector(
        //   onTap: onTapFace,
        //   child: const SocailCard(image: 'assets/images/face.svg'),
        // ),
        // horizontalSpace(8),
        // GestureDetector(
        //   onTap: onTapApple,
        //   child: const SocailCard(
        //     image: 'assets/images/apple.svg',
        //   ),
        // ),
        // horizontalSpace(8),
        GestureDetector(
          onTap: onTapGoogle,
          child: const SocailCard(image: 'assets/images/google.svg'),
        ),
      ],
    );
  }
}

class SocailCard extends StatelessWidget {
  const SocailCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: MyColors.grayscale200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(image),
      ),
    );
  }
}
