import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:flutter/material.dart';

class SettingsAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.defaultHeight * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'TestBank',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: Sizes.dimen_20,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black.withOpacity(0.4),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(Sizes.dimen_20),
            ),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: Sizes.dimen_12,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
