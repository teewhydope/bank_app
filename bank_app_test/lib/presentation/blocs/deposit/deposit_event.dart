part of 'deposit_bloc.dart';

abstract class DepositEvent extends Equatable {
  const DepositEvent();

  @override
  List<Object> get props => [];
}

class PhoneNumberChanged extends DepositEvent {
  final String phoneNumber;
  PhoneNumberChanged({
    required this.phoneNumber,
  });
}

class AmountChanged extends DepositEvent {
  final String amount;
  AmountChanged({
    required this.amount,
  });
}

class FormSubmitted extends DepositEvent {}
