import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.defaultHeight * 0.1,
      child: Row(
        children: [
          Text(
            'TestBank',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: Sizes.dimen_20,
            ),
          ),
          SizedBox(
            width: ScreenUtil.defaultWidth * 0.03,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.dimen_12,
              vertical: Sizes.dimen_6,
            ),
            decoration: BoxDecoration(
              color: Color(0xff2B3044),
              borderRadius: BorderRadius.circular(Sizes.dimen_20),
            ),
            child: Text(
              'My Account',
              style: TextStyle(
                fontSize: Sizes.dimen_12,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: AppColor.kwhiteColor,
            child: Center(
              child: Text(
                'TB',
                style: GoogleFonts.acme(
                  color: AppColor.kPrimaryColor,
                  fontSize: Sizes.dimen_16,
                ),
              ),
            ),
            radius: Sizes.dimen_18,
          ),
        ],
      ),
    );
  }
}
