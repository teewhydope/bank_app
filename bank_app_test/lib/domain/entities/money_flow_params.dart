import 'package:equatable/equatable.dart';

class MoneyFlowParams extends Equatable {
  final String phoneNumber;
  final String amount;

  MoneyFlowParams({
    required this.phoneNumber,
    required this.amount,
  });

  @override
  List<Object?> get props => [phoneNumber, amount];
}
