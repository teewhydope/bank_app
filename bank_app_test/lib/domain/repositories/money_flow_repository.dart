import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class MoneyFlowRepository {
  Future<Either<AppError, Map>> withdraw(String phoneNumber, String amount);
  Future<Either<AppError, Map>> deposit(String phoneNumber, String amount);
}
