import 'package:bank_app_test/presentation/pages/auth/sign_up_page.dart';
import 'package:bank_app_test/presentation/pages/dashboard/dashboard_page.dart';
import 'package:bank_app_test/presentation/pages/auth/login_page.dart';
import 'package:bank_app_test/presentation/pages/nav_bar.dart';
import 'package:bank_app_test/presentation/pages/welcome_page.dart';
import 'package:flutter/widgets.dart';

class Routes {
  Routes._();
  //routes

  //static variables
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signUp = '/signUp';

  static const String dashboard = '/dashboard';
  static const String navBar = '/navBar';

  static final routes = <String, WidgetBuilder>{
    welcome: (context) => WelcomePage(),
    login: (context) => LoginPage(),
    signUp: (context) => SignUpPage(),
    dashboard: (context) => DashBoardPage(),
    navBar: (context) => NavBar(),
  };
}
