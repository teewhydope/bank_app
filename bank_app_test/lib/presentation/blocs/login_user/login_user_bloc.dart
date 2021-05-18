import 'dart:async';
import 'package:bank_app_test/di/get_it.dart' as getIt;
import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/entities/auth_params.dart';
import 'package:bank_app_test/domain/usecases/loginUser.dart';
import 'package:bank_app_test/presentation/blocs/form_submission_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_user_event.dart';
part 'login_user_state.dart';

class LoginUserBloc extends Bloc<LoginUserEvent, LoginUserState> {
  LoginUser loginUser = getIt.getItInstance<LoginUser>();
  LoginUserBloc({
    required this.loginUser,
  }) : super(LoginUserInitial());

  @override
  Stream<LoginUserState> mapEventToState(
    LoginUserEvent event,
  ) async* {
    //phone updated
    if (event is LoginPhoneNumberChanged) {
      yield state.copyWith(phoneNumber: event.phoneNumber);
      //Password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
      //Form Submitted
    } else if (event is LoginFormSubmitted) {
      //await Future.delayed(Duration(seconds: 3));
      yield state.copyWith(formStatus: FormSubmitting());
      final loginEither = await loginUser(AuthParams(
        phoneNumber: state.phoneNumber,
        password: state.password,
      ));
      yield loginEither.fold(
        (l) {
          var message = getErrorMessage(l.appErrorType);
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
        return 'User not found';
      default:
        return 'Login error';
    }
  }
}
