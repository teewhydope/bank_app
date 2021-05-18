import 'dart:io';
import 'package:bank_app_test/data/datasources/remote_datasource/get_details_remote_data_source.dart';
import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/entities/transaction_list_entity.dart';
import 'package:bank_app_test/domain/repositories/get_details_repository.dart';
import 'package:dartz/dartz.dart';

class GetDetailsRepositoryImpl extends GetDetailsRepository {
  final GetDetailsRemoteDataSource getDetailsRemoteDataSource;

  GetDetailsRepositoryImpl({
    required this.getDetailsRemoteDataSource,
  });

  @override
  Future<Either<AppError, List<TransactionListEntity>>>
      transactionList() async {
    try {
      final response = await getDetailsRemoteDataSource.transactionList();
      return right(response);
    } on SocketException {
      return left(AppError(AppErrorType.network));
    } on Exception {
      return left(AppError(AppErrorType.api));
    }
  }
}
