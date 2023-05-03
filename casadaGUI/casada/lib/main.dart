import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final response =
    await http.get(Uri.parse('http://localhost:8080/member'));
    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Data Table',
      home: Scaffold(
        appBar: AppBar(
          title: Text('API Data Table'),
        ),
        body: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Email',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Phone',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: _data
              .map(
                (dynamic item) => DataRow(
              cells: <DataCell>[
                DataCell(
                  Text(item['memberId'].toString()),
                ),
                DataCell(
                  Text(item['memberName']),
                ),
                DataCell(
                  Text(item['memberSurname']),
                ),
              ],
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}