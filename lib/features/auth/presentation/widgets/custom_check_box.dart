import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChecked});
  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 22,
        width: 22,
        decoration: ShapeDecoration(
          color: isChecked ? MyColors.prime : MyColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isChecked ? MyColors.prime : MyColors.grayscale200,
              width: 1.5,
            ),
          ),
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                  'assets/images/checked.svg',
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
