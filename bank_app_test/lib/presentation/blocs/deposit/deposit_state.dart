part of 'deposit_bloc.dart';

class DepositState extends Equatable {
  final String phoneNumber;
  bool get isValidPhoneNumber => phoneNumber.length == 11;

  final String amount;
  bool get isValidAmount => amount.length > 0;

  final FormSubmissionStatus formStatus;

  DepositState({
    this.phoneNumber = '',
    this.amount = '',
    this.formStatus = const InitialFormStatus(),
  });

  DepositState copyWith({
    String? phoneNumber,
    String? amount,
    final FormSubmissionStatus? formStatus,
  }) {
    return DepositState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      amount: amount ?? this.amount,
      formStatus: formStatus ?? InitialFormStatus(),
    );
  }

  @override
  List<Object> get props => [phoneNumber, amount, formStatus];
}

class DepositInitial extends DepositState {}
