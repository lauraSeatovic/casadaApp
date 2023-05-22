import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
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

  void sendData(String url, Map<String, Object?> body) async {
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
    print("$apiUrl$url");
    final response = await http.get(Uri.parse("$apiUrl$url"));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> getPDF(String url) async {
    final response = await http.get(Uri.parse('$apiUrl$url'));

    if (response.statusCode == io.HttpStatus.ok) {
      final io.Directory? downloadsDirectory = await getDownloadsDirectory();
      if (downloadsDirectory != null) {
        final file = io.File('${downloadsDirectory.path}/document.pdf');
        await file.writeAsBytes(response.bodyBytes);
        // File saved successfully
      } else {
        // Handle null downloadsDirectory
        print('Downloads directory not available');
      }
    } else {
      // Handle error
      print('Error downloading PDF: ${response.statusCode}');
    }
  }

  Future<String> getHTML(String url) async {
    final response = await http.get(Uri.parse('$apiUrl$url'));
    if (response.statusCode == io.HttpStatus.ok) {
      final decodedResponse = utf8.decode(response.bodyBytes);
      final htmlContent = response.body;
      return decodedResponse;
    } else {
      print("ne radi");
      // Handle error
      print('Error downloading HTML: ${response.statusCode}');
      return "";
    }
  }
}
