import 'package:firebase_login_test/core/helper/extensions_route.dart';
import 'package:firebase_login_test/core/helper/spacing.dart';
import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:firebase_login_test/core/utils/const.dart';
import 'package:firebase_login_test/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcceptTermsCondation extends StatefulWidget {
  const AcceptTermsCondation({super.key, required this.onChecked});

  final ValueChanged<bool> onChecked;

  @override
  State<AcceptTermsCondation> createState() => _RememberMeState();
}

class _RememberMeState extends State<AcceptTermsCondation> {
  bool isTermAccepted = false;

  _RememberMeState();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermAccepted = value;
            widget.onChecked(value);
            setState(() {});
          },
          isChecked: isTermAccepted,
        ),
        horizontalSpace(10),
        // widget.text ?? const SizedBox(),
        GestureDetector(
          onTap: () {
            context.pushNamed(termAndCond);
          },
          child: RichText(
            text: TextSpan(
              text: "Agree to ",
              style: getSemiBoldStyle(
                color: MyColors.grayscale400,
                fontSize: 13.sp,
              ),
              children: [
                TextSpan(
                  text: 'our terms and conditions',
                  style: getSemiBoldStyle(
                    color: MyColors.prime,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
