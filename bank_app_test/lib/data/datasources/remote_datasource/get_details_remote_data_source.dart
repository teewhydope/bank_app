import 'package:bank_app_test/data/core/ApiClients/get_details_client.dart';
import 'package:bank_app_test/data/models/transaction_list_model.dart';

abstract class GetDetailsRemoteDataSource {
  Future<List<Datum>> transactionList();
}

class GetDetailsRemoteDataSourceImpl extends GetDetailsRemoteDataSource {
  final GetDetailsClient _client;
  GetDetailsRemoteDataSourceImpl(this._client);
  @override
  Future<List<Datum>> transactionList() async {
    final response = await _client.get('transactions');
    final transactionList = TransactionListModel.fromJson(response).data;
    //print(transactionList);
    return transactionList;
  }
}
