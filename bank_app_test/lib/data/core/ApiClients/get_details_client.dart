import 'dart:convert';

import 'package:http/http.dart';

import '../api_constants.dart';

class GetDetailsClient {
  final Client _client;
  GetDetailsClient(this._client);

  dynamic get(String path) async {
    final response = await _client
        .get(
          Uri.parse('${ApiConstants.BASE_URL}$path'),
        )
        .timeout(Duration(seconds: 30));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
