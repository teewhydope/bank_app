part of 'get_transaction_cubit.dart';

abstract class GetTransactionState extends Equatable {
  const GetTransactionState();

  @override
  List<Object> get props => [];
}

class GetTransactionInitial extends GetTransactionState {}

class GetTransactionsLoading extends GetTransactionState {}

class GetTransactionsError extends GetTransactionState {
  final AppErrorType errorType;

  const GetTransactionsError({
    required this.errorType,
  });
  List<Object> get props => [errorType];
}

class GetTransactionsLoaded extends GetTransactionState {
  final List<TransactionListEntity> transactions;

  const GetTransactionsLoaded({
    required this.transactions,
  });
  @override
  List<Object> get props => [transactions];
}
