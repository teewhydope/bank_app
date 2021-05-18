import 'dart:ui';

import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.dimen_20,
        ),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.kPrimaryColor,
              Color(0xff2B3044),
            ]),
      ),
      height: ScreenUtil.screenHeight * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(Sizes.dimen_18),
        child: CircleAvatar(
          backgroundColor: AppColor.kwhiteColor,
          child: Text(
            'AI',
            style: GoogleFonts.nunito(
              fontSize: Sizes.dimen_60,
              color: AppColor.kGreyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
