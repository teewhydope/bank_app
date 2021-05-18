import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<AppError, Map>> loginUser(String phoneNumber, String password);
  Future<Either<AppError, Map>> signUpUser(String phoneNumber, String password);
}
