
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiData {
  final String apiUrl;

  ApiData(this.apiUrl);

  Future<List<dynamic>> getData(String url) async {
    final response = await http.get(Uri.parse("$apiUrl$url"));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}