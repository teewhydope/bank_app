import 'package:bank_app_test/common/constants/device_size/device_size.dart';
import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/constants/routes/routes_constant.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/di/get_it.dart' as getIt;
import 'package:bank_app_test/presentation/blocs/form_submission_status.dart';
import 'package:bank_app_test/presentation/blocs/login_user/login_user_bloc.dart';
import 'package:bank_app_test/presentation/provider/authDetails.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:bank_app_test/presentation/widgets/app_logo.dart';
import 'package:bank_app_test/presentation/widgets/buttons/custom_elevated_button.dart';
import 'package:bank_app_test/presentation/widgets/buttons/custom_text_button.dart';
import 'package:bank_app_test/presentation/widgets/textfields/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late LoginUserBloc _loginUserBloc;
  var _obscureText = true;

  @override
  void initState() {
    super.initState();
    _loginUserBloc = getIt.getItInstance<LoginUserBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _loginUserBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider<LoginUserBloc>.value(
            value: _loginUserBloc,
            child: _loginForm(),
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<LoginUserBloc, LoginUserState>(
      bloc: _loginUserBloc,
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is FormSubmissionError) {
          _showSnackBar(context, formStatus.errorType.toString());
        } else if (formStatus is FormSubmissionSuccess) {
          _navigateToDashBoard();
        }
      },
      child: Container(
        height: deviceHeight,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.dimen_24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: ScreenUtil.defaultHeight * 0.2,
                  child: AppLogo(),
                ),
                _phoneNumberField(),
                _passwordField(),
                SizedBox(height: Sizes.dimen_18),
                _loginButton(),
                _gotoSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _phoneNumberField() {
    return BlocBuilder<LoginUserBloc, LoginUserState>(
      bloc: _loginUserBloc,
      builder: (context, state) {
        var dat = Provider.of<AuthDetails>(context);
        return CustomTextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(11),
            FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            dat.phoneNumber = value;
            return _loginUserBloc
                .add(LoginPhoneNumberChanged(phoneNumber: value));
          },
          validator: (value) =>
              state.isValidPhoneNumber ? null : 'Invalid phone number',
          hintText: 'Phone',
          icon: MdiIcons.phone,
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginUserBloc, LoginUserState>(
      bloc: _loginUserBloc,
      builder: (context, state) {
        return CustomTextFormField(
          obscureText: _obscureText,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
          ],
          onChanged: (value) =>
              _loginUserBloc.add(LoginPasswordChanged(password: value)),
          validator: (value) =>
              state.isValidPassword ? null : 'Password is too short',
          hintText: 'Password',
          icon: MdiIcons.security,
          suffixIcon: IconButton(
            color: AppColor.kPrimaryColor,
            icon: Icon(
              _obscureText ? MdiIcons.eyeCircleOutline : MdiIcons.eyeCircle,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginUserBloc, LoginUserState>(
      bloc: _loginUserBloc,
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? buildLoading()
            : CustomElevatedButton(
                fn: () {
                  if (_formKey.currentState!.validate()) {
                    _loginUserBloc.add(LoginFormSubmitted());
                  }
                },
                title: 'Login',
              );
      },
    );
  }

  /// Responsible method for loading widget
  Widget buildLoading() {
    return Container(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(AppColor.kPrimaryColor),
      ),
      padding: EdgeInsets.all(Sizes.dimen_6),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.amber,
      ),
    ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _gotoSignUp() {
    return CustomTextButton(
      fn: () {
        Navigator.of(context).pushNamed(
          Routes.signUp,
        );
      },
      title: 'Don\'t have an account? Sign up.',
    );
  }

  _navigateToDashBoard() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.navBar,
      (route) => false,
    );
  }
}
