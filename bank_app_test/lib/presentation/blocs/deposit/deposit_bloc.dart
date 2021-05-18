import 'dart:async';
import 'package:bank_app_test/di/get_it.dart' as getIt;
import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/entities/money_flow_params.dart';
import 'package:bank_app_test/domain/usecases/deposit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../form_submission_status.dart';

part 'deposit_event.dart';
part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  Deposit deposit = getIt.getItInstance<Deposit>();

  DepositBloc({
    required this.deposit,
  }) : super(DepositInitial());

  @override
  Stream<DepositState> mapEventToState(
    DepositEvent event,
  ) async* {
//phone updated
    if (event is PhoneNumberChanged) {
      yield state.copyWith(phoneNumber: event.phoneNumber);
      //amount updated
    } else if (event is AmountChanged) {
      yield state.copyWith(amount: event.amount);
      //Form Submitted
    } else if (event is FormSubmitted) {
      //await Future.delayed(Duration(seconds: 3));
      yield state.copyWith(formStatus: FormSubmitting());
      final depositEither = await deposit(MoneyFlowParams(
        phoneNumber: state.phoneNumber,
        amount: state.amount,
      ));
      yield depositEither.fold(
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
        return 'Insufficient balance';
      default:
        return 'An error occured';
    }
  }
}
