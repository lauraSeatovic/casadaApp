import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailScreen extends StatefulWidget {
  final int orderId;

  OrderDetailScreen({required this.orderId});

  @override
  _OrderDetailScreen createState() => _OrderDetailScreen();
}

class _OrderDetailScreen extends State<OrderDetailScreen> {

  @override
  Widget build(BuildContext context) {
    final int stepLength = 4;
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova narudžba'),
      ),
      body: Text(widget.orderId.toString()),);
  }
}