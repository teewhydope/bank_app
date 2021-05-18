import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/entities/no_params.dart';
import 'package:bank_app_test/domain/entities/transaction_list_entity.dart';
import 'package:bank_app_test/domain/usecases/transaction_list.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_transaction_state.dart';

class GetTransactionCubit extends Cubit<GetTransactionState> {
  final TransactionList transactionList;
  GetTransactionCubit({
    required this.transactionList,
  }) : super(GetTransactionInitial());

  void loadTransaction() async {
    final transactionListEither = await transactionList(NoParams());
    emit(transactionListEither.fold(
      (l) => GetTransactionsError(errorType: l.appErrorType),
      (r) {
        return GetTransactionsLoaded(transactions: r);
      },
    ));
  }
}
