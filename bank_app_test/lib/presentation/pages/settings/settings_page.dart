import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/presentation/pages/settings/components/logout.dart';
import 'package:bank_app_test/presentation/pages/settings/components/settings_app_bar.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
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
                              onTap: () {
                                showAnimatedDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            Sizes.dimen_10),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: Container(
                                            color: Colors.white,
                                            height:
                                                ScreenUtil.defaultHeight * 0.4,
                                            width:
                                                ScreenUtil.defaultWidth * 0.8,
                                            child: LogoutCard(),
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
