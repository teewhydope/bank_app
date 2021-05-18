import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsMenuItem extends StatelessWidget {
  final String text;

  const SettingsMenuItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.dimen_10,
        vertical: Sizes.dimen_10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.nunito(
              fontSize: Sizes.dimen_16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
          ),
        ],
      ),
    );
  }
}
