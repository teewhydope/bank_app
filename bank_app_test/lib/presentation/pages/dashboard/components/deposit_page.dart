import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/constants/routes/routes_constant.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/presentation/blocs/deposit/deposit_bloc.dart';
import 'package:bank_app_test/presentation/blocs/form_submission_status.dart';
import 'package:bank_app_test/presentation/pages/dashboard/components/transaction_success.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:bank_app_test/presentation/widgets/buttons/custom_elevated_button.dart';
import 'package:bank_app_test/presentation/widgets/textfields/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bank_app_test/di/get_it.dart' as getIt;

class DepositPage extends StatefulWidget {
  @override
  _DepositPageState createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final _formKey = GlobalKey<FormState>();
  late DepositBloc _depositBloc;

  @override
  void initState() {
    super.initState();
    _depositBloc = getIt.getItInstance<DepositBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _depositBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DepositBloc>.value(
      value: _depositBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<DepositBloc, DepositState>(
          bloc: _depositBloc,
          listener: (context, state) {
            final formStatus = state.formStatus;
            if (formStatus is FormSubmissionError) {
              _showSnackBar(context, formStatus.errorType.toString());
            } else if (formStatus is FormSubmissionSuccess) {
              showAnimatedDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Sizes.dimen_10),
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          color: Colors.white,
                          height: ScreenUtil.defaultHeight * 0.4,
                          width: ScreenUtil.defaultWidth * 0.8,
                          child: TransactionSuccess(),
                        ),
                      ),
                    ),
                  );
                },
                animationType: DialogTransitionType.fade,
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 800),
              );
            }
          },
          child: Container(
            padding: EdgeInsets.only(
              top: Sizes.dimen_20,
              left: Sizes.dimen_20,
              right: Sizes.dimen_20,
            ),
            child: _depositForm(),
          ),
        ),
      ),
    );
  }

  Widget _depositForm() {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          _depositText(context),
          _phoneNumberField(),
          _amountField(),
          _depositButton(),
        ],
      ),
    );
  }

  Widget _depositText(BuildContext context) {
    return Text(
      'Deposit money',
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }

  Widget _phoneNumberField() {
    return BlocBuilder<DepositBloc, DepositState>(
      builder: (context, state) {
        return CustomTextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(11),
            FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            return _depositBloc.add(PhoneNumberChanged(phoneNumber: value));
          },
          validator: (value) =>
              state.isValidPhoneNumber ? null : 'Invalid phone number',
          hintText: 'Phone',
          icon: MdiIcons.phone,
        );
      },
    );
  }

  Widget _amountField() {
    return BlocBuilder<DepositBloc, DepositState>(
      builder: (context, state) {
        return CustomTextFormField(
          hintText: 'Amount',
          icon: MdiIcons.phone,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) => _depositBloc.add(AmountChanged(amount: value)),
          validator: (value) => state.isValidAmount ? null : 'Invalid amount',
        );
      },
    );
  }

  Widget _depositButton() {
    return BlocBuilder<DepositBloc, DepositState>(
      bloc: _depositBloc,
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? buildLoading()
            : CustomElevatedButton(
                fn: () {
                  if (_formKey.currentState!.validate()) {
                    _depositBloc.add(FormSubmitted());
                  }
                },
                title: 'Deposit',
              );
      },
    );
  }

  /// Responsible method for loading widget
  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(AppColor.kPrimaryColor),
      ),
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
}
