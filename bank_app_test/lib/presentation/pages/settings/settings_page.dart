import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/presentation/pages/settings/components/settings_app_bar.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'components/settings_menu_item.dart';
import 'components/settings_profile_card.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(
              left: Sizes.dimen_16,
              right: Sizes.dimen_16,
              top: Sizes.dimen_16,
            ),
            constraints: BoxConstraints(
              //TODO
              maxWidth: ScreenUtil.defaultWidth * 0.95,
            ),
            child: Column(
              children: [
                SettingsAppBar(),
                Expanded(
                  child: CustomScrollView(
                    key: PageStorageKey<String>("more"),
                    slivers: [
                      SliverAppBar(
                        expandedHeight: ScreenUtil.screenHeight * 0.3,
                        titleSpacing: 10,
                        elevation: 0,
                        pinned: true,
                        backgroundColor: AppColor.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.dimen_32),
                        ),
                        flexibleSpace: SettingsProfileCard(),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate.fixed(
                          [
                            //SettingsProfileCard(),
                            Divider(
                              height: Sizes.dimen_20,
                              color: AppColor.kwhiteColor,
                            ),
                            SettingsMenuItem(
                              text: "My Account Information",
                            ),
                            Divider(
                              height: Sizes.dimen_20,
                            ),
                            SettingsMenuItem(
                              text: "Edit profile",
                            ),
                            Divider(
                              height: Sizes.dimen_20,
                            ),
                            SettingsMenuItem(
                              text: "Change PIN",
                            ),
                            Divider(
                              height: Sizes.dimen_20,
                            ),
                            SettingsMenuItem(
                              text: "Change Password",
                            ),
                            Divider(
                              height: Sizes.dimen_20,
                            ),
                            SettingsMenuItem(
                              text: "Transaction Limit",
                            ),
                            Divider(
                              height: Sizes.dimen_20,
                            ),
                            SettingsMenuItem(
                              text: "Fingerprint Login",
                            ),
                            Divider(
                              height: Sizes.dimen_20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SettingsMenuItem(
                                text: "Logout",
                              ),
                            ),
                            Divider(
                              height: Sizes.dimen_20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
