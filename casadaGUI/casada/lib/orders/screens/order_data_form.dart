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

class OrderDataForm extends StatefulWidget {
  const OrderDataForm({
    Key? key,
  }) : super(key: key);
  @override
  _OrderDataFormState createState() => _OrderDataFormState();
}

class _OrderDataFormState extends State<OrderDataForm> {
  final _orderBloc = OrdersBloc();
  final _memberBloc = MemberBloc();
  bool _isEditable = false;
  final _formKey = GlobalKey<FormState>();
  DateTime _orderDate = DateTime.now();
  bool _personalPickup = false;
  String _orderNote = "";
  int _deliveryPersonId = 1;
  int _sellerId = 1;
  String _orderStatusName = "";
  int _paymentMethodId = 1;
  String _paymentMethodName = "";
  String _deliveryDate = "";
  double _orderDiscount = 0;
  String _otherPayment = "";
  double _orderDeposit = 0;
  bool _isFullPaid = false;
  String _orderNumber = "";
  bool _orderStatusNotifications = false;
  List<Member> _members = [];
  List<PaymentMethod> _payments = [];
  TextEditingController _sellerController = TextEditingController();
  TextEditingController _deliveryPersonController = TextEditingController();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _orderDate = pickedDate;
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
    return Form(
      key: widget.key,
      child: Column(children: [
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
              text: DateFormat('yyyy-MM-dd').format(_orderDate),
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
              value: _personalPickup,
              onChanged: (bool value) {
                setState(() {
                  _personalPickup = value;
                });
              },
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Order Note'),
          enabled: _isEditable,
          validator: (value) {
            return null;
          },
          onChanged: (value) {
            setState(() {
              _orderNote = value;
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
              _deliveryPersonController.text =
                  "${suggestion.memberName!} ${suggestion.memberSurname!}";
              _deliveryPersonId = suggestion.memberId!;
            });
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Order Status Name'),
          enabled: _isEditable,
          validator: (value) {
            return null;
          },
          onChanged: (value) {
            setState(() {
              _orderStatusName = value;
            });
          },
        ),
        DropdownButtonFormField<int>(
          value: _paymentMethodId,
          onChanged: (value) {
            setState(() {
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
          enabled: _isEditable,
          validator: (value) {
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
          enabled: _isEditable,
          validator: (value) {
            return null;
          },
          onChanged: (value) {
            setState(() {
              _orderDiscount = double.tryParse(value)!;
            });
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Other Payment'),
          enabled: _isEditable,
          validator: (value) {
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
          enabled: _isEditable,
          validator: (value) {
            return null;
          },
          onChanged: (value) {
            setState(() {
              _orderDeposit = double.tryParse(value)!;
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
                  _isFullPaid = value;
                });
              },
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Order Number'),
          initialValue: _orderNumber,
          enabled: _isEditable,
          validator: (value) {
            return null;
          },
          onChanged: (value) {
            setState(() {
              _orderNumber = value;
            });
          },
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
                  _orderStatusNotifications = value;
                });
              },
            ),
          ],
        ),
      ]),
    );
  }
}
