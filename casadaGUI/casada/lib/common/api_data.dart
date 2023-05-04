
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiData {
  final String apiUrl;

  ApiData(this.apiUrl);

  Future<List<Map<String, dynamic>>> getData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      return jsonData.map((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}