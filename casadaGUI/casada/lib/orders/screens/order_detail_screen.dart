import 'package:casada/orders/screens/buyer_data_widget.dart';
import 'package:casada/orders/screens/order_data_widget.dart';
import 'package:casada/orders/screens/product_catalog_step.dart';
import 'package:casada/orders/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailScreen extends StatefulWidget {
  final int orderId;
  final int buyerId;

  OrderDetailScreen({required this.orderId, required this.buyerId});

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: OrderDataWidget(orderId: widget.orderId),
                ),
                Expanded(
                  child: BuyerDataWidget(buyerId: widget.buyerId),
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.all(16.0),
                child: Center(child: ProductDetails(orderId: widget.orderId)))
          ],
        ),
      ),
    );
  }
}
