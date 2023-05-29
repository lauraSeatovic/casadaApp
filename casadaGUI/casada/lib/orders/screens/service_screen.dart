import 'dart:developer';

import 'package:casada/data/service.dart';
import 'package:casada/data/order_product.dart';
import 'package:casada/orders/orders_bloc.dart';
import 'package:casada/orders/screens/services_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceScreen extends StatefulWidget {
  final int orderId;

  const ServiceScreen({super.key, required this.orderId});

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final _orderBloc = OrdersBloc();
  List<Service> _oldServices = [];
  List<OrderProduct> _orderProduct = [];
  DateTime _serviseStartDate = DateTime.now();
  DateTime _serviseEndDate = DateTime.now();
  String _serviceNote = "";
  double _servicePrice = 0;
  int? _productId;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loadData();
  }

  void _loadData() async {
    try {
      final orderProducts =
          await _orderBloc.loadAllOrderProduct(widget.orderId);
      final services = await _orderBloc.loadAllService(widget.orderId);
      setState(() {
        _orderProduct = orderProducts;
        _oldServices = services;
      });
    } catch (e) {
      // handle error
    }
  }

  Future<void> _selectStartDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _serviseStartDate = pickedDate;
      });
    }
  }

  Future<void> _selectEndDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _serviseEndDate = pickedDate;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Servisi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0), // specify the width you want
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Dodaj novi servis',
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
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _orderBloc.addSErvice(
                              _serviseStartDate,
                              _serviseEndDate,
                              _serviceNote,
                              _servicePrice,
                              _productId!,
                              widget.orderId);
                        });
                      },
                      child: Text('Dodaj'),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: _selectStartDate,
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today),
                      labelText: 'Pocetak servisa',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    controller: TextEditingController(
                      text: DateFormat('dd-MM-yyyy').format(_serviseStartDate),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: GestureDetector(
                    onTap: _selectEndDate,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        labelText: 'Kraj servisa',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      controller: TextEditingController(
                        text: DateFormat('dd-MM-yyyy').format(_serviseEndDate),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Opis servisa'),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (String value) {
                    setState(() {
                      _serviceNote = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Cijena servisa'),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (String value) {
                    setState(() {
                      _servicePrice = double.tryParse(value)!;
                    });
                  },
                ),
                DropdownButtonFormField<int>(
                  value: _productId,
                  onChanged: (value) {
                    setState(() {
                      _productId = value!;
                    });
                  },
                  items: _orderProduct
                      .map(
                        (entry) => DropdownMenuItem<int>(
                          value: entry.productid,
                          child: Text(entry.productName!),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Povijest servisa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                ServicesDataTable(services: _oldServices)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
