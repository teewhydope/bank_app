import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'TB',
          style: GoogleFonts.acme(
            color: AppColor.kPrimaryColor,
            fontSize: Sizes.dimen_80,
          ),
        ),
      ),
    );
  }
}
