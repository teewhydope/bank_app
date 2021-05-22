import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/presentation/pages/welcome_page.dart';
import 'package:bank_app_test/presentation/provider/authDetails.dart';
import 'package:bank_app_test/presentation/themes/theme_text.dart';
import 'package:bank_app_test/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'common/constants/routes/routes_constant.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;
import 'presentation/themes/theme_color.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  ScreenUtil.init();
  unawaited(SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthDetails>(
      create: (context) => AuthDetails(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            brightness: Brightness.light,
            primarySwatch: createMaterialColor(Color(AppColor.cPrimaryColor)),
          ),
          primaryColor: AppColor.kPrimaryColor,
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: AppColor.kPrimaryColor,
          ),
          iconTheme: IconThemeData(
            color: AppColor.kPrimaryColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: AppColor.kPrimaryColor,
              textStyle: GoogleFonts.nunito(
                //fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.kPrimaryColor,
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: AppColor.kPrimaryColor,
              textStyle: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
          ),
        ),
        home: AnimatedSplashScreen(
          centered: true,
          duration: 4000,
          splash: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColor.kwhiteColor,
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'TB',
                style: GoogleFonts.acme(
                  color: AppColor.kPrimaryColor,
                  fontSize: Sizes.dimen_60,
                ),
              ),
            ),
          ),
          nextScreen: WelcomePage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: AppColor.kPrimaryColor,
        ),
        routes: Routes.routes,
      ),
    );
  }
}
