import 'package:core/api/api.abs.dart';
import 'package:core/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiImpl implements Api {
  @override
  Future delete() {
    throw UnimplementedError();
  }

  @override
  Future post() {
    throw UnimplementedError();
  }

  @override
  Future put() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    var url = Uri.https(ApiConstants.apiUrl, path, body);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body) as Map<String, dynamic>;
    }
    return {};
  }
}
