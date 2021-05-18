import 'package:bank_app_test/presentation/blocs/nav_bar/nav_bar_cubit.dart';
import 'package:bank_app_test/presentation/pages/dashboard/dashboard_page.dart';
import 'package:bank_app_test/presentation/pages/more/more_page.dart';
import 'package:bank_app_test/presentation/pages/settings/settings_page.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavBarCubit(),
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: BlocBuilder<NavBarCubit, int>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  _changeBottomNav(context, index);
                },
                currentIndex: state,
                selectedItemColor: AppColor.gblackColor,
                unselectedItemColor: AppColor.kGreyColor,
                //showSelectedLabels: false,
                //showUnselectedLabels: false,
                backgroundColor: AppColor.kwhiteColor,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(MdiIcons.account), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.more_horiz), label: 'More'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ],
              ),
              body: _buildBody(state),
            );
          },
        ),
      ),
    );
  }

  void _changeBottomNav(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.read<NavBarCubit>().getDashBoard();
        break;
      case 1:
        context.read<NavBarCubit>().getMore();
        break;
      case 2:
        context.read<NavBarCubit>().getSettings();
        break;
    }
  }

  Widget _buildBody(index) {
    switch (index) {
      case 0:
        return DashBoardPage();
      case 1:
        return MorePage();
      case 2:
        return SettingsPage();
    }
    return DashBoardPage();
  }
}
