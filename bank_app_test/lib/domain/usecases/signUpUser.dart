import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/entities/auth_params.dart';
import 'package:bank_app_test/domain/repositories/auth_repository.dart';
import 'package:bank_app_test/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class SignUpUser extends UseCase<Map, AuthParams> {
  final AuthRepository authRepository;

  SignUpUser(
    this.authRepository,
  );

  @override
  Future<Either<AppError, Map>> call(AuthParams authParams) async {
    return await authRepository.signUpUser(
      authParams.phoneNumber,
      authParams.password,
    );
  }
}
