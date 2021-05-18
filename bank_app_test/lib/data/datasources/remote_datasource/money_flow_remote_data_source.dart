import 'package:bank_app_test/data/core/ApiClients/money_flow_client.dart';

abstract class MoneyFlowRemoteDataSource {
  Future<Map> withdraw(String phoneNumber, String amount);
  Future<Map> deposit(String phoneNumber, String amount);
}

class MoneyFlowRemoteDataSourceImpl extends MoneyFlowRemoteDataSource {
  final MoneyFlowClient _client;
  MoneyFlowRemoteDataSourceImpl(this._client);
  @override
  Future<Map> withdraw(String phoneNumber, String amount) async {
    final response = await _client.get(
      'accounts/withdraw',
      phoneNumber,
      amount,
    );
    print(response);
    return response;
  }

  @override
  Future<Map> deposit(String phoneNumber, String amount) async {
    final response = await _client.get(
      'accounts/deposit',
      phoneNumber,
      amount,
    );
    print(response);
    return response;
  }
}
