import 'dart:async';
import 'package:bank_app_test/di/get_it.dart' as getIt;
import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/entities/auth_params.dart';
import 'package:bank_app_test/domain/usecases/signUpUser.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../form_submission_status.dart';

part 'sign_up_user_state.dart';
part 'sign_up_user_event.dart';

class SignUpUserBloc extends Bloc<SignUpUserEvent, SignUpUserState> {
  SignUpUser signUpUser = getIt.getItInstance<SignUpUser>();
  SignUpUserBloc({
    required this.signUpUser,
  }) : super(SignUpUserInitial());

  @override
  Stream<SignUpUserState> mapEventToState(
    SignUpUserEvent event,
  ) async* {
    //phone updated
    if (event is SignUpPhoneNumberChanged) {
      yield state.copyWith(phoneNumber: event.phoneNumber);
      //Password updated
    } else if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is SignUpConfirmPasswordChanged) {
      yield state.copyWith(confirmPassword: event.confirmPassword);
      //Form Submitted
    } else if (event is SignUpFormSubmitted) {
      //await Future.delayed(Duration(seconds: 3));
      yield state.copyWith(formStatus: FormSubmitting());
      final signUpEither = await signUpUser(AuthParams(
        phoneNumber: state.phoneNumber,
        password: state.password,
      ));
      yield signUpEither.fold(
        (l) {
          var message = getErrorMessage(l.appErrorType);
          print(l);
          print(message);
          return state.copyWith(
              formStatus: FormSubmissionError(errorType: message));
        },
        (r) => state.copyWith(formStatus: FormSubmissionSuccess()),
      );
    }
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.network:
        return 'Network error';
      case AppErrorType.api:
        return 'Phone number is registered';
      default:
        return 'sign up error';
    }
  }
}
