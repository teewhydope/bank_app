import 'package:bank_app_test/data/models/transaction_list_model.dart';
import 'package:equatable/equatable.dart';

class TransactionListEntity extends Equatable {
  final Types? type;
  final int amount;
  final String phoneNumber;
  final DateTime created;
  final int? balance;

  TransactionListEntity({
    required this.type,
    required this.amount,
    required this.phoneNumber,
    required this.created,
    this.balance,
  });

  @override
  List<Object?> get props => [type, amount, balance];
}
