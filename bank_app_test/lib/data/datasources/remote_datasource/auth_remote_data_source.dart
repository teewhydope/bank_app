import 'package:bank_app_test/data/core/ApiClients/auth_client.dart';

abstract class AuthRemoteDataSource {
  Future<Map> loginUser(String phoneNumber, String password);
  Future<Map> signUpUser(String phoneNumber, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final AuthClient _client;
  AuthRemoteDataSourceImpl(this._client);
  @override
  Future<Map> loginUser(String phoneNumber, String password) async {
    final response = await _client.get(
      'auth/login',
      phoneNumber,
      password,
    );
    print(response);
    return response;
  }

  @override
  Future<Map> signUpUser(String phoneNumber, String password) async {
    final response = await _client.get(
      'auth/signup',
      phoneNumber,
      password,
    );
    print(response);
    return response;
  }
}
