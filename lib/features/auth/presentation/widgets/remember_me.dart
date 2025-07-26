import 'package:firebase_login_test/core/helper/spacing.dart';
import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:firebase_login_test/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key, required this.onChecked, this.text});

  final ValueChanged<bool> onChecked;
  final Widget? text;

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool isTermAccepted = false;

  _RememberMeState();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            setState(() {
              isTermAccepted = value;
              widget.onChecked(value);
            });
          },
          isChecked: isTermAccepted,
        ),
        horizontalSpace(10),
        widget.text ?? const SizedBox(),
        // RichText(
        //   text: TextSpan(
        //     text: "من خلال إنشاء حساب, فإنك توافق على ",
        //     style: getSemiBoldStyle(
        //       color: MyColors.grayscale400,
        //       fontSize: 15,
        //     ),
        //     children: [
        //       TextSpan(
        //         text: 'الشروط \nوالاحكام الخاصة بنا',
        //         style: getSemiBoldStyle(
        //           color: MyColors.green700,
        //           fontSize: 15,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Spacer(),
        Text(
          'Forgot Password?',
          style: getRegularStyle(
            color: MyColors.prime,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
