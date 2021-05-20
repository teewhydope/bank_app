import 'package:bank_app_test/common/constants/device_size/device_size.dart';
import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/constants/routes/routes_constant.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:bank_app_test/presentation/widgets/buttons/custom_elevated_button.dart';
import 'package:bank_app_test/presentation/widgets/buttons/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.dimen_24,
            horizontal: Sizes.dimen_18,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: ScreenUtil.defaultWidth * 0.2,
                          child: Text(
                            'TB',
                            style: GoogleFonts.acme(
                              fontSize: Sizes.dimen_32,
                              color: AppColor.kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil.screenWidth * 0.1,
                          height: ScreenUtil.defaultHeight * 0.01,
                          decoration: BoxDecoration(
                            color: AppColor.kPrimaryColor,
                            borderRadius: BorderRadius.circular(
                              2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil.defaultHeight * 0.05,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: deviceWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to\nthe new\nTestBank',
                        style: GoogleFonts.nunito(
                          fontSize: Sizes.dimen_32,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kGreyColor,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil.defaultHeight * 0.05,
                      ),
                      Text(
                        'New level of features\nwith the new app',
                        style: GoogleFonts.nunito(
                          fontSize: Sizes.dimen_24,
                          color: AppColor.kGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Column(
                children: [
                  CustomElevatedButton(
                    fn: () {
                      Navigator.of(context).pushNamed(Routes.login);
                    },
                    title: 'Proceed to login',
                  ),
                  CustomTextButton(
                    fn: () {
                      Navigator.of(context).pushNamed(
                        Routes.signUp,
                      );
                    },
                    title: 'Signup',
                    fontSize: Sizes.dimen_20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
