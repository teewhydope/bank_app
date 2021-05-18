import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:flutter/material.dart';

class MoreAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.defaultHeight * 0.07,
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
              horizontal: Sizes.dimen_12,
              vertical: Sizes.dimen_6,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(Sizes.dimen_20),
            ),
            child: Text(
              'Transaction History',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
