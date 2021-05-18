import 'dart:io';

import 'package:bank_app_test/data/datasources/remote_datasource/auth_remote_data_source.dart';
import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<AppError, Map>> loginUser(
      String phoneNumber, String password) async {
    try {
      final response =
          await authRemoteDataSource.loginUser(phoneNumber, password);
      return right(response);
    } on SocketException {
      return left(AppError(AppErrorType.network));
    } on Exception {
      return left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map>> signUpUser(
      String phoneNumber, String password) async {
    try {
      final response =
          await authRemoteDataSource.signUpUser(phoneNumber, password);
      return right(response);
    } on SocketException {
      return left(AppError(AppErrorType.network));
    } on Exception {
      return left(AppError(AppErrorType.api));
    }
  }
}
