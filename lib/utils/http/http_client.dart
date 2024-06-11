import 'dart:convert';

import 'package:http/http.dart' as http;

class CustomHttpHelper {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<dynamic> get(String endPoint) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$endPoint'),
    );
    return _handleResponse(response);
  }

  static Future<dynamic> post(String endPoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endPoint'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return _handleResponse(response);
  }

  static Future<dynamic> put(String endPoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endPoint'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return _handleResponse(response);
  }

  static Future<dynamic> delete(String endPoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endPoint'));
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
