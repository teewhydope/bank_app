import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/entities/no_params.dart';
import 'package:bank_app_test/domain/entities/transaction_list_entity.dart';
import 'package:bank_app_test/domain/repositories/get_details_repository.dart';
import 'package:bank_app_test/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class TransactionList extends UseCase<List<TransactionListEntity>, NoParams> {
  final GetDetailsRepository getDetailsRepository;

  TransactionList(
    this.getDetailsRepository,
  );
  @override
  Future<Either<AppError, List<TransactionListEntity>>> call(
      NoParams noParams) async {
    return await getDetailsRepository.transactionList();
  }
}
