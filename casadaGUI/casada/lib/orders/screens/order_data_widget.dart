import 'dart:ffi';

import 'package:casada/data/buyer.dart';
import 'package:casada/orders/buyers_bloc.dart';
import 'package:casada/orders/orders_bloc.dart';
import 'package:flutter/material.dart';

import '../../data/order.dart';

class OrderDataWidget extends StatefulWidget {
  final int orderId;
  const OrderDataWidget({Key? key, required this.orderId}) : super(key: key);

  @override
  _OrderDataWidgetState createState() => _OrderDataWidgetState();
}

class _OrderDataWidgetState extends State<OrderDataWidget> {
  final _orderBloc = OrdersBloc();
  bool _isEditable = false;
  final _formKey = GlobalKey<FormState>();
  Order? _order;
  String? _orderDate;
  bool? _personalPickup;
  String? _orderNote;
  int? _deliveryPersonId;
  int? _sellerId;
  String? _orderStatusName;
  String? _paymentMethodName;
  String? _deliveryDate;
  double? _orderDiscount;
  String? _otherPayment;
  double? _orderDeposit;
  bool? _isFullPaid;
  String? _orderNumber;
  bool? _orderStatusNotifications;

  @override
  void initState() {
    _loadOrder();
    super.initState();
  }

  void _loadOrder() async {
    try {
      final order = await _orderBloc.loadOrderById(widget.orderId);
      setState(() {
        _orderDate = order.orderDate;
        _personalPickup = order.personalPickup;
        _orderNote = order.orderNote;
        _deliveryPersonId = order.deliveryPersonId;
        _sellerId = order.sellerId;
        _orderStatusName = order.orderStatusName;
        _paymentMethodName = order.paymentMethodName;
        _deliveryDate = order.deliveryDate;
        _orderDiscount = order.orderDiscount;
        _otherPayment = order.otherPayment;
        _orderDeposit = order.orderDeposit;
        _isFullPaid = order.isFullPaid;
        _orderNumber = order.orderNumber;
        _orderStatusNotifications = order.orderStatusNotifications;
        _order = order;
      });
    } catch (e) {
      // handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return _order != null
        ? Padding(
            padding: EdgeInsets.all(30.0), // specify the width you want
            child: Form(
              child: Column(
                children: [
                  Row(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Informacije o kupcu',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        if (_isEditable)
                          ElevatedButton(
                            onPressed: () {
                              // Perform the saving action
                              print('Saving...');
                              // You can add your own saving logic here
                            },
                            child: Text('Save'),
                          ),
                        if (!_isEditable)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isEditable = !_isEditable;
                              });
                            },
                            child: Text('Edit'),
                          ),
                      ],
                    )
                  ]),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Order Date'),
                    initialValue: _orderDate,
                    enabled: _isEditable,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the order date';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _orderDate = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Personal Pickup'),
                    initialValue: _personalPickup?.toString(),
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _personalPickup = value == 'true';
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Order Note'),
                    initialValue: _orderNote,
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _orderNote = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Delivery Person ID'),
                    initialValue: _deliveryPersonId?.toString(),
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _deliveryPersonId = int.tryParse(value);
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Seller ID'),
                    initialValue: _sellerId?.toString(),
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _sellerId = int.tryParse(value);
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Order Status Name'),
                    initialValue: _orderStatusName,
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _orderStatusName = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Payment Method Name'),
                    initialValue: _paymentMethodName,
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _paymentMethodName = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Delivery Date'),
                    initialValue: _deliveryDate,
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _deliveryDate = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Order Discount'),
                    initialValue: _orderDiscount?.toString(),
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _orderDiscount = double.tryParse(value);
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Other Payment'),
                    initialValue: _otherPayment,
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _otherPayment = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Order Deposit'),
                    initialValue: _orderDeposit?.toString(),
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _orderDeposit = double.tryParse(value);
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Is Full Paid'),
                    initialValue: _isFullPaid?.toString(),
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _isFullPaid = value == 'true';
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Order Number'),
                    initialValue: _orderNumber,
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _orderNumber = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Order Status Notifications'),
                    initialValue: _orderStatusNotifications?.toString(),
                    enabled: _isEditable,
                    validator: (value) {
                      // Add validation logic if needed
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _orderStatusNotifications = value == 'true';
                      });
                    },
                  ),
                ],
              ),
            ))
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
