
import 'package:flutter/material.dart';
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

  void sendData(String url, Map<String, Object?> body) async{
    try {
        final response = await http.post(
          Uri.parse("$apiUrl$url"),
          headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
          body: jsonEncode(body),
        );

        if (response.statusCode == 200) {
          // Form data sent successfully
          print('Form data sent successfully');
        } else {
          // Request failed
          print('Failed to send form data. Error: ${response.statusCode}');
        }
      } catch (e) {
        // Error occurred
        print('Error sending form data: $e');
      }
  }

  Future<dynamic> getSingleData(String url) async {
    final response = await http.get(Uri.parse("$apiUrl$url"));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}