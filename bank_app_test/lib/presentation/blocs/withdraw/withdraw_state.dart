part of 'withdraw_bloc.dart';

class WithdrawState extends Equatable {
  final String phoneNumber;
  bool get isValidPhoneNumber => phoneNumber.length == 11;

  final String amount;
  bool get isValidAmount => amount.length > 0;

  final FormSubmissionStatus formStatus;

  WithdrawState({
    this.phoneNumber = '',
    this.amount = '',
    this.formStatus = const InitialFormStatus(),
  });

  WithdrawState copyWith({
    String? phoneNumber,
    String? amount,
    final FormSubmissionStatus? formStatus,
  }) {
    return WithdrawState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      amount: amount ?? this.amount,
      formStatus: formStatus ?? InitialFormStatus(),
    );
  }

  @override
  List<Object> get props => [phoneNumber, amount, formStatus];
}

class WithdrawInitial extends WithdrawState {}
