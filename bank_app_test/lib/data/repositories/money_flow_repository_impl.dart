import 'dart:io';
import 'package:bank_app_test/data/datasources/remote_datasource/money_flow_remote_data_source.dart';
import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/repositories/money_flow_repository.dart';
import 'package:dartz/dartz.dart';

class MoneyFlowRepositoryImpl extends MoneyFlowRepository {
  final MoneyFlowRemoteDataSource moneyFlowRemoteDataSource;

  MoneyFlowRepositoryImpl({required this.moneyFlowRemoteDataSource});

  @override
  Future<Either<AppError, Map>> withdraw(
      String phoneNumber, String amount) async {
    try {
      final response =
          await moneyFlowRemoteDataSource.withdraw(phoneNumber, amount);
      return right(response);
    } on SocketException {
      return left(AppError(AppErrorType.network));
    } on Exception {
      return left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map>> deposit(
      String phoneNumber, String amount) async {
    try {
      final response =
          await moneyFlowRemoteDataSource.deposit(phoneNumber, amount);
      return right(response);
    } on SocketException {
      return left(AppError(AppErrorType.network));
    } on Exception {
      return left(AppError(AppErrorType.api));
    }
  }
}
