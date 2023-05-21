import 'dart:ffi';

import 'package:casada/data/buyer.dart';
import 'package:casada/orders/buyers_bloc.dart';
import 'package:flutter/material.dart';

class BuyerDataWidget extends StatefulWidget {
  final int buyerId;
  const BuyerDataWidget({Key? key, required this.buyerId}) : super(key: key);

  @override
  _BuyerDataWidgetState createState() => _BuyerDataWidgetState();
}

class _BuyerDataWidgetState extends State<BuyerDataWidget> {
  final _buyerBloc = BuyersBloc();
  bool _isEditable = false;
  final _formKey = GlobalKey<FormState>();
  Buyer? _buyer = null;
  String _buyerName = "";
  String _buyerSurname = "";
  String _buyerHome = "";
  String _buyerDelivery = "";
  String _buyerPhone = "";
  String _buyerEmail = "";
  @override
  void initState() {
    _loadBuyer();
  }

  void _loadBuyer() async {
    try {
      final buyer = await _buyerBloc.loadBuyerById(widget.buyerId);
      setState(() {
        _buyerName = buyer.buyerName!;
        _buyerSurname = buyer.buyerSurname!;
        _buyerHome = buyer.buyerHomeAddress!;
        _buyerDelivery = buyer.buyerDeliveryAddress!;
        _buyerPhone = buyer.buyerPhoneNumber!;
        _buyerEmail = buyer.buyerEmail!;
        _buyer = buyer;
      });
    } catch (e) {
      // handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buyer != null
        ? Padding(
            padding: EdgeInsets.all(30.0), // specify the width you want
            child: Form(
              child: Column(
                children: [
                  Row(
                    children: [
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
                  SizedBox(width: 30,),
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
                    decoration: InputDecoration(labelText: 'Ime'),
                    initialValue: _buyerName,
                    enabled: _isEditable,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite ime kupca';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Prezime'),
                    initialValue: _buyerSurname,
                    enabled: _isEditable,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite prezime kupca';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Broj telefona'),
                    initialValue: _buyerPhone,
                    enabled: _isEditable,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite broj telefona kupca';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Adresa stanovanja'),
                    initialValue: _buyerHome,
                    enabled: _isEditable,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite adresu stanovanja';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Adresa dostave'),
                    initialValue: _buyerDelivery,
                    enabled: _isEditable,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite adresu dostave';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    initialValue: _buyerEmail,
                    enabled: _isEditable,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite email kupca';
                      }
                      return null;
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
