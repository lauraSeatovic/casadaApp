import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../orders_bloc.dart';

class OrderHtmlScreen extends StatefulWidget {
  final int orderId;

  OrderHtmlScreen({required this.orderId});

  @override
  _OrderHtmlScreenState createState() => _OrderHtmlScreenState();
}

class _OrderHtmlScreenState extends State<OrderHtmlScreen> {
  final _orderBloc = OrdersBloc();
  String _orderHtml = "";

  @override
  void initState() {
    _loadHtml();
    super.initState();
  }

  void _loadHtml() async {
    try {
      final html = await _orderBloc.getOrderHTML(widget.orderId);
      setState(() {
        _orderHtml = html;
      });
    } catch (e) {
      // handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Narudžba'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: HtmlWidget(
            _orderHtml,
            webView: true,
            webViewJs: true,
            webViewMediaPlaybackAlwaysAllow: true,
          ),
        ),
      ),
    );
  }
}