import 'package:casada/data/order.dart';
import 'package:casada/orders/screens/all_orders_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../orders_bloc.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  final _ordersBloc = OrdersBloc();
  @override
  void initState() {
    _ordersBloc.loadAllOrders();
  }

  void _loadOrders() async {
    try {
      await _ordersBloc.loadAllOrders();
    } catch (e) {
      // handle error
    }
  }

  Widget _buildTable() {
    return StreamBuilder<List<Order>>(
      stream: _ordersBloc.allOrdersStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AllOrdersTable(data: snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Narudžbe',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          _buildTable(),
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        child: const Icon(Icons.add),
        type: ExpandableFabType.up,
        distance: 70,
        children: [
          FloatingActionButton.extended(
            heroTag: null,
            label: Text("Masažni uređaj"),
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          FloatingActionButton.extended(
            heroTag: null,
            label: Text("Sportski uređaj"),
            icon: Icon(Icons.directions_run),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
