import 'package:casada/data/status.dart';
import 'package:casada/orders/orders_bloc.dart';
import 'package:flutter/material.dart';

class StatusChangeWidget extends StatefulWidget {
  final int orderId;
  final int statustId;

  StatusChangeWidget({required this.orderId, required this.statustId});
  @override
  _StatusChangeWidgetState createState() => _StatusChangeWidgetState();
}

class _StatusChangeWidgetState extends State<StatusChangeWidget> {
  final _orderBloc = OrdersBloc();
  List<Status> _statuses = [];

  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _price;
  String? _code;
  late int _selectedId;
  bool _isActive = true;

  @override
  void initState() {
    _loadStatus();
    _selectedId = widget.statustId;
  }

  void _loadStatus() async {
    try {
      final statuses = await _orderBloc.loadAllStatus();
      setState(() {
        _statuses = statuses;
      });
    } catch (e) {
      // handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Status narudžbe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Status narudžbe',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 16.0),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: 200,
                child: DropdownButtonFormField<int>(
                  value: _selectedId,
                  onChanged: (value) {
                    setState(() {
                      _selectedId = value!;
                    });
                  },
                  items: _statuses
                      .map(
                        (entry) => DropdownMenuItem<int>(
                          value: entry.orderStatusId,
                          child: Text(entry.orderStatusName!),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            ElevatedButton(
              onPressed: () {
                _orderBloc.changeStatus(widget.orderId, _selectedId);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Promijenjen status narudžbe!'),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: Text('Promijeni'),
            ),
          ],
        ),
      ),
    );
  }
}
