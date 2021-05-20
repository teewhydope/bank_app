import 'package:bank_app_test/common/constants/device_size/device_size.dart';
import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/constants/routes/routes_constant.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/di/get_it.dart' as getIt;
import 'package:bank_app_test/presentation/blocs/form_submission_status.dart';
import 'package:bank_app_test/presentation/blocs/sign_up_user/sign_up_user_bloc.dart';
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

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late SignUpUserBloc _signUpUserBloc;
  var _obscureText1 = true;
  var _obscureText2 = true;

  @override
  void initState() {
    super.initState();
    _signUpUserBloc = getIt.getItInstance<SignUpUserBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _signUpUserBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider<SignUpUserBloc>.value(
            value: _signUpUserBloc,
            child: _loginForm(),
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<SignUpUserBloc, SignUpUserState>(
      bloc: _signUpUserBloc,
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
                _confirmPasswordField(),
                SizedBox(height: Sizes.dimen_18),
                _signUpButton(),
                _gotoLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _phoneNumberField() {
    return BlocBuilder<SignUpUserBloc, SignUpUserState>(
      bloc: _signUpUserBloc,
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
            return _signUpUserBloc
                .add(SignUpPhoneNumberChanged(phoneNumber: value));
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
    return BlocBuilder<SignUpUserBloc, SignUpUserState>(
      bloc: _signUpUserBloc,
      builder: (context, state) {
        return CustomTextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
          ],
          onChanged: (value) =>
              _signUpUserBloc.add(SignUpPasswordChanged(password: value)),
          validator: (value) =>
              state.isValidPassword ? null : 'Password is too short',
          hintText: 'Password',
          icon: MdiIcons.security,
          obscureText: _obscureText1,
          suffixIcon: IconButton(
            color: AppColor.kPrimaryColor,
            icon: Icon(
              _obscureText1 ? MdiIcons.eyeCircleOutline : MdiIcons.eyeCircle,
            ),
            onPressed: () {
              setState(() {
                _obscureText1 = !_obscureText1;
              });
            },
          ),
        );
      },
    );
  }

  Widget _confirmPasswordField() {
    return BlocBuilder<SignUpUserBloc, SignUpUserState>(
      bloc: _signUpUserBloc,
      builder: (context, state) {
        return CustomTextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
          ],
          onChanged: (value) => _signUpUserBloc.add(
            SignUpConfirmPasswordChanged(confirmPassword: value),
          ),
          validator: (value) =>
              state.isConfirmPassword ? null : 'Password does not match',
          hintText: 'Confirm password',
          icon: MdiIcons.security,
          obscureText: _obscureText2,
          suffixIcon: IconButton(
            color: AppColor.kPrimaryColor,
            icon: Icon(
              _obscureText2 ? MdiIcons.eyeCircleOutline : MdiIcons.eyeCircle,
            ),
            onPressed: () {
              setState(() {
                _obscureText2 = !_obscureText2;
              });
            },
          ),
        );
      },
    );
  }

  Widget _signUpButton() {
    return BlocBuilder<SignUpUserBloc, SignUpUserState>(
      bloc: _signUpUserBloc,
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? buildLoading()
            : CustomElevatedButton(
                fn: () {
                  if (_formKey.currentState!.validate()) {
                    _signUpUserBloc.add(SignUpFormSubmitted());
                  }
                },
                title: 'Sign Up',
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

  Widget _gotoLogin() {
    return CustomTextButton(
      fn: () {
        Navigator.of(context).pushNamed(
          Routes.login,
        );
      },
      title: 'Already have an account? Log in.',
    );
  }

  _navigateToDashBoard() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.navBar,
      (route) => false,
    );
  }
}
