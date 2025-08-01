import 'package:firebase_login_test/core/recourses/color_manager/color_manager.dart';
import 'package:firebase_login_test/core/recourses/fount_manager/font_manager.dart';
import 'package:firebase_login_test/core/recourses/styles_manger/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.maxLine,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.controller,
    this.type,
    this.hintText,
    this.onSaved,
    this.prefixIcon,
  });

  final TextInputType? type;
  final bool? obscureText;
  final String? hintText;
  final IconData? suffixIcon;
  final Widget? prefixIcon;

  final int? maxLine;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? false;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onSaved: widget.onSaved,
          validator: widget.validator,
          maxLines: widget.maxLine ?? 1,
          controller: widget.controller,
          keyboardType: widget.type,
          style: getSemiBoldStyle(
            color: MyColors.black,
            fontSize: FontSizeManager.s16,
          ),
          obscureText: _obscureText,
          decoration: InputDecoration(
            // fillColor: MyColors.grayscale150,
            // filled: true,
            contentPadding: const EdgeInsetsDirectional.only(
              start: 20,
              top: 20,
              bottom: 20,
              end: 20,
            ),
            hintText: widget.hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(11),
              child: widget.prefixIcon,
            ),
            hintStyle: getBoldStyle(
              color: MyColors.grayscale400,
              fontSize: FontSizeManager.s14,
            ),
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    icon: Icon(
                      widget.suffixIcon,
                      color: MyColors.grayscale400,
                      size: 26,
                    ),
                    onPressed: _toggleObscureText,
                  )
                : null,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Color(0xFFE6E9E9)),
    );
  }
}
