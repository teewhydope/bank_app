part of 'withdraw_bloc.dart';

abstract class WithdrawEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PhoneNumberChanged extends WithdrawEvent {
  final String phoneNumber;
  PhoneNumberChanged({
    required this.phoneNumber,
  });
}

class AmountChanged extends WithdrawEvent {
  final String amount;
  AmountChanged({
    required this.amount,
  });
}

class FormSubmitted extends WithdrawEvent {}
