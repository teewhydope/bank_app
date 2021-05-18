import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/constants/routes/routes_constant.dart';
import 'package:bank_app_test/presentation/widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Transaction Successful',
              style: GoogleFonts.nunito(
                fontSize: Sizes.dimen_20,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomElevatedButton(
              fn: () {
                _navigateToDashBoard(context);
              },
              title: 'Done',
            )
          ],
        ),
      ),
    );
  }

  _navigateToDashBoard(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.navBar,
      (route) => false,
    );
  }
}
