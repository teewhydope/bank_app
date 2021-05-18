import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/presentation/pages/dashboard/components/withdraw_page.dart';
import 'package:bank_app_test/presentation/provider/authDetails.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'deposit_page.dart';

class SavingsAccountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dat = Provider.of<AuthDetails>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.dimen_10,
        ),
        //color: Color(0xffFAE04B),
        color: AppColor.kwhiteColor,
      ),
      width: ScreenUtil.defaultWidth.toDouble(),
      height: ScreenUtil.defaultHeight * 0.14,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Sizes.dimen_20,
          right: Sizes.dimen_20,
          top: Sizes.dimen_20,
          bottom: Sizes.dimen_10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Savings Account ★',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      dat.phoneNumber.toString(),
                      style: TextStyle(
                        fontSize: Sizes.dimen_14,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    )
                  ],
                ),
                Text(
                  "₦0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.dimen_18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Sizes.dimen_10),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                color: Colors.white,
                                height: ScreenUtil.defaultHeight * 0.4,
                                width: ScreenUtil.defaultWidth * 0.8,
                                child: DepositPage(),
                              ),
                            ),
                          ),
                        );
                      },
                      animationType: DialogTransitionType.fade,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 800),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.dimen_20),
                      color: AppColor.kPrimaryColor,
                    ),
                    height: ScreenUtil.defaultHeight * 0.04,
                    width: ScreenUtil.defaultWidth * 0.3,
                    child: Center(
                        child: Text(
                      'Deposit',
                      style: GoogleFonts.nunito(
                        color: AppColor.kwhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Sizes.dimen_10),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                color: Colors.white,
                                height: ScreenUtil.defaultHeight * 0.4,
                                width: ScreenUtil.defaultWidth * 0.8,
                                child: WithdrawPage(),
                              ),
                            ),
                          ),
                        );
                      },
                      animationType: DialogTransitionType.fade,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 800),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.dimen_20),
                      color: AppColor.kPrimaryColor,
                    ),
                    height: ScreenUtil.defaultHeight * 0.04,
                    width: ScreenUtil.defaultWidth * 0.3,
                    child: Center(
                        child: Text(
                      'WithDraw',
                      style: GoogleFonts.nunito(
                        color: AppColor.kwhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
