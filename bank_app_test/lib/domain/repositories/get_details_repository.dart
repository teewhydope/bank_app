import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/entities/transaction_list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetDetailsRepository {
  Future<Either<AppError, List<TransactionListEntity>>> transactionList();
}
