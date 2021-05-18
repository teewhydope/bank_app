import 'dart:convert';

import 'package:http/http.dart';
import '../api_constants.dart';

class MoneyFlowClient {
  final Client _client;
  MoneyFlowClient(this._client);

  dynamic get(String path, String param1, String param2) async {
    final response = await _client.post(
      Uri.parse('${ApiConstants.BASE_URL}$path'),
      body: {
        "phoneNumber": param1,
        "amount": param2,
      },
    ).timeout(Duration(seconds: 30));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
