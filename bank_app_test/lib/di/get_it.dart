import 'package:bank_app_test/data/core/ApiClients/auth_client.dart';
import 'package:bank_app_test/data/core/ApiClients/get_details_client.dart';
import 'package:bank_app_test/data/core/ApiClients/money_flow_client.dart';
import 'package:bank_app_test/data/datasources/remote_datasource/auth_remote_data_source.dart';
import 'package:bank_app_test/data/datasources/remote_datasource/get_details_remote_data_source.dart';
import 'package:bank_app_test/data/datasources/remote_datasource/money_flow_remote_data_source.dart';
import 'package:bank_app_test/data/repositories/auth_repository_impl.dart';
import 'package:bank_app_test/data/repositories/get_details_repository_impl.dart';
import 'package:bank_app_test/data/repositories/money_flow_repository_impl.dart';
import 'package:bank_app_test/domain/repositories/auth_repository.dart';
import 'package:bank_app_test/domain/repositories/get_details_repository.dart';
import 'package:bank_app_test/domain/repositories/money_flow_repository.dart';
import 'package:bank_app_test/domain/usecases/deposit.dart';
import 'package:bank_app_test/domain/usecases/loginUser.dart';
import 'package:bank_app_test/domain/usecases/signUpUser.dart';
import 'package:bank_app_test/domain/usecases/transaction_list.dart';
import 'package:bank_app_test/domain/usecases/withdraw.dart';
import 'package:bank_app_test/presentation/blocs/deposit/deposit_bloc.dart';
import 'package:bank_app_test/presentation/blocs/get_transaction/get_transaction_cubit.dart';
import 'package:bank_app_test/presentation/blocs/login_user/login_user_bloc.dart';
import 'package:bank_app_test/presentation/blocs/sign_up_user/sign_up_user_bloc.dart';
import 'package:bank_app_test/presentation/blocs/withdraw/withdraw_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  //Http Client
  getItInstance.registerLazySingleton<Client>(() => Client());

  /***** Api Clients *****/

  //Auth Client
  getItInstance
      .registerLazySingleton<AuthClient>(() => AuthClient(getItInstance()));

  //Get Details Client
  getItInstance.registerLazySingleton<GetDetailsClient>(
      () => GetDetailsClient(getItInstance()));

  //Money Flow Client
  getItInstance.registerLazySingleton<MoneyFlowClient>(
      () => MoneyFlowClient(getItInstance()));

  /***** Data Sources *****/

  //AuthRemoteDataSource
  getItInstance.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getItInstance()));

  //GetDetailsRemoteDataSource
  getItInstance.registerLazySingleton<GetDetailsRemoteDataSource>(
      () => GetDetailsRemoteDataSourceImpl(getItInstance()));

  //MoneyFlowRemoteDataSource
  getItInstance.registerLazySingleton<MoneyFlowRemoteDataSource>(
      () => MoneyFlowRemoteDataSourceImpl(getItInstance()));

  /***** Repositories *****/

  //GetDetailsRepository
  getItInstance.registerLazySingleton<GetDetailsRepository>(() =>
      GetDetailsRepositoryImpl(getDetailsRemoteDataSource: getItInstance()));

  //AuthRepository
  getItInstance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: getItInstance()));

  //MoneyFlowRepository
  getItInstance.registerLazySingleton<MoneyFlowRepository>(() =>
      MoneyFlowRepositoryImpl(moneyFlowRemoteDataSource: getItInstance()));

  /***** Usecases *****/

  //LoginUser
  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));

  //SignUpUser
  getItInstance
      .registerLazySingleton<SignUpUser>(() => SignUpUser(getItInstance()));

  //TransactionList
  getItInstance.registerLazySingleton<TransactionList>(
      () => TransactionList(getItInstance()));

  //Deposit
  getItInstance.registerLazySingleton<Deposit>(() => Deposit(getItInstance()));

  //Withdraw
  getItInstance
      .registerLazySingleton<Withdraw>(() => Withdraw(getItInstance()));

  /***** Blocs/Cubits *****/

  //LoginUserBloc
  getItInstance
      .registerFactory(() => LoginUserBloc(loginUser: getItInstance()));

  //SignUpUserBloc
  getItInstance
      .registerFactory(() => SignUpUserBloc(signUpUser: getItInstance()));

  //GetTransactionCubit
  getItInstance.registerFactory(
      () => GetTransactionCubit(transactionList: getItInstance()));

  //DepositBloc
  getItInstance.registerFactory(() => DepositBloc(deposit: getItInstance()));

  //WithdrawBloc
  getItInstance.registerFactory(() => WithdrawBloc(withdraw: getItInstance()));
}
