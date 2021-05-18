import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Function fn;
  final String title;
  final double? fontSize;

  CustomTextButton({
    required this.fn,
    required this.title,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: fn as void Function()?,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
