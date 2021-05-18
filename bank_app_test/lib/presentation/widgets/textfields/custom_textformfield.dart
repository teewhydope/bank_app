import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;

  CustomTextFormField({
    required this.hintText,
    required this.icon,
    required this.inputFormatters,
    required this.validator,
    required this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColor.kBackgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        inputFormatters: inputFormatters,
        cursorColor: AppColor.kPrimaryColor,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: AppColor.kPrimaryColor,
            ),
            border: InputBorder.none,
            hintText: hintText,
            suffixIcon: suffixIcon),
      ),
    );
  }
}
