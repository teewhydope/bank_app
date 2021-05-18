import 'package:bank_app_test/domain/entities/app_error.dart';
import 'package:bank_app_test/domain/entities/money_flow_params.dart';
import 'package:bank_app_test/domain/repositories/money_flow_repository.dart';
import 'package:bank_app_test/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class Withdraw extends UseCase<Map, MoneyFlowParams> {
  final MoneyFlowRepository moneyFlowRepository;

  Withdraw(
    this.moneyFlowRepository,
  );

  @override
  Future<Either<AppError, Map>> call(MoneyFlowParams moneyFlowParams) async {
    return await moneyFlowRepository.withdraw(
      moneyFlowParams.phoneNumber,
      moneyFlowParams.amount,
    );
  }
}
