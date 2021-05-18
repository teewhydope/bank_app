import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function fn;
  final String title;

  CustomElevatedButton({
    required this.fn,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: ScreenUtil.defaultWidth * 0.8,
        height: 55,
      ),
      child: ElevatedButton(
        onPressed: fn as void Function()?,
        child: Text(title),
      ),
    );
  }
}
