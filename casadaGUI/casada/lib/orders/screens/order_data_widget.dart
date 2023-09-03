import 'dart:ffi';

import 'package:casada/data/buyer.dart';
import 'package:casada/members/mamber_bloc.dart';
import 'package:casada/orders/buyers_bloc.dart';
import 'package:casada/orders/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';

import '../../data/member.dart';
import '../../data/order.dart';
import '../../data/payment_method.dart';

class OrderDataWidget extends StatefulWidget {
  final int orderId;
  const OrderDataWidget({Key? key, required this.orderId}) : super(key: key);

  @override
  _OrderDataWidgetState createState() => _OrderDataWidgetState();
}

class _OrderDataWidgetState extends State<OrderDataWidget> {
  final _orderBloc = OrdersBloc();
  final _memberBloc = MemberBloc();
  bool _isEditable = false;
  final _formKey = GlobalKey<FormState>();
  Order? _order;
  DateTime? _orderDate;
  bool? _personalPickup;
  String? _orderNote;
  int? _deliveryPersonId;
  int? _sellerId;
  String? _orderStatusName;
  int? _paymentMethodId;
  String? _paymentMethodName;
  String? _deliveryDate;
  double? _orderDiscount;
  String? _otherPayment;
  double? _orderDeposit;
  bool? _isFullPaid;
  String? _orderNumber;
  bool? _orderStatusNotifications;
  List<Member> _members = [];
  List<PaymentMethod> _payments = [];
  TextEditingController _sellerController = TextEditingController();
  TextEditingController _deliveryPersonController = TextEditingController();

  @override
  void initState() {
    _loadOrder();
    _loadData();
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
        _paymentMethodId = order.paymentMethodId;
        _paymentMethodName = order.paymentMethodName;
        _deliveryDate = order.deliveryDate;
        _orderDiscount = order.orderDiscount;
        _otherPayment = order.otherPayment;
        _orderDeposit = order.orderDeposit;
        _isFullPaid = order.isFullPaid;
        _orderNumber = order.orderNumber;
        _orderStatusNotifications = order.orderStatusNotifications;
        _order = order;
        _sellerController.text = "${order.sellerName!} ${order.sellerSurname!}";
        _deliveryPersonController.text =
            "${order.deliveryPersonName!} ${order.deliveryPersonSurname!}";
      });
    } catch (e) {
      // handle error
    }
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _orderDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _orderDate = pickedDate;
        _order = _order!.copyWith(orderDate: pickedDate);
      });
    }
  }

  void _loadData() async {
    try {
      final members = await _memberBloc.loadAllMember();
      final payments = await _orderBloc.loadAllPaymentMethod();
      setState(() {
        _members = members;
        _payments = payments;
      });
    } catch (e) {
      // handle error
    }
  }

  List<Member> _suggestion(String text) {
    return _members.where((member) {
      return member.memberName
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          member.memberSurname
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return _order != null
        ? Padding(
            padding: EdgeInsets.all(30.0),
            child: Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Informacije o narudzbi',
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
                            _orderBloc.editOrder(_order!);
                          });
                        },
                        child: Text('Spremi'),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: _selectDate,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        labelText: 'Datum',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      controller: TextEditingController(
                        text: _orderDate != null
                            ? DateFormat('dd-MM-yyyy').format(_orderDate!)
                            : '',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Osobno preuzimanje',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 8.0),
                      Switch(
                        value: _personalPickup!,
                        onChanged: (bool value) {
                          setState(() {
                            _personalPickup = value;
                            _order = _order!.copyWith(personalPickup: value);
                          });
                        },
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Order Note'),
                    initialValue: _orderNote,
                    validator: (value) {
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _orderNote = value;
                        _order = _order!.copyWith(orderNote: value);
                      });
                    },
                  ),
                  TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _sellerController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Prodavac',
                        errorText: null,
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      return _suggestion(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(
                            "${suggestion.memberName!} ${suggestion.memberSurname!}"),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        _order =
                            _order!.copyWith(sellerId: suggestion.memberId);
                        _sellerController.text =
                            "${suggestion.memberName!} ${suggestion.memberSurname!}";
                        _sellerId = suggestion.memberId!;
                      });
                    },
                  ),
                  TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _deliveryPersonController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Dostavljac',
                        errorText: null,
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      return _suggestion(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(
                            "${suggestion.memberName!} ${suggestion.memberSurname!}"),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        _order = _order!
                            .copyWith(deliveryPersonId: suggestion.memberId);
                        _deliveryPersonController.text =
                            "${suggestion.memberName!} ${suggestion.memberSurname!}";
                        _deliveryPersonId = suggestion.memberId!;
                      });
                    },
                  ),
                  DropdownButtonFormField<int>(
                    value: _paymentMethodId,
                    onChanged: (value) {
                      setState(() {
                        _order = _order!.copyWith(paymentMethodId: value);
                        _paymentMethodId = value!;
                      });
                    },
                    items: _payments
                        .map((entry) => DropdownMenuItem<int>(
                              value: entry.paymentMethodId,
                              child: Text(entry.paymentMethodName!),
                            ))
                        .toList(),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Opis dostave'),
                    initialValue: _deliveryDate,
                    validator: (value) {
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _order = _order!.copyWith(deliveryDate: value);
                        _deliveryDate = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Popust'),
                    initialValue: _orderDiscount?.toString(),
                    validator: (value) {
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _order = _order!
                            .copyWith(orderDiscount: double.tryParse(value));
                        _orderDiscount = double.tryParse(value);
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Polog'),
                    initialValue: _orderDeposit?.toString(),
                    validator: (value) {
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _order = _order!
                            .copyWith(orderDeposit: double.tryParse(value));
                        _orderDeposit = double.tryParse(value);
                      });
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        'Plaćeno u potpunosti',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 8.0),
                      Switch(
                        value: _isFullPaid!,
                        onChanged: (bool value) {
                          setState(() {
                            _order = _order!.copyWith(isFullPaid: value);
                            _isFullPaid = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Obavijesti o narudžbi',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 8.0),
                      Switch(
                        value: _orderStatusNotifications!,
                        onChanged: (bool value) {
                          setState(() {
                            _order = _order!
                                .copyWith(orderStatusNotifications: value);
                            _orderStatusNotifications = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ))
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
