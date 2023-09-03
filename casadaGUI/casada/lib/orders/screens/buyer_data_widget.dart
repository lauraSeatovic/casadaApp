import 'dart:ffi';

import 'package:casada/data/buyer.dart';
import 'package:casada/data/city.dart';
import 'package:casada/orders/buyers_bloc.dart';
import 'package:casada/orders/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class BuyerDataWidget extends StatefulWidget {
  final int buyerId;
  const BuyerDataWidget({Key? key, required this.buyerId}) : super(key: key);

  @override
  _BuyerDataWidgetState createState() => _BuyerDataWidgetState();
}

class _BuyerDataWidgetState extends State<BuyerDataWidget> {
  final _buyerBloc = BuyersBloc();
  final _orderBloc = OrdersBloc();
  List<City> _cities = [];
  bool _isEditable = false;
  final _formKey = GlobalKey<FormState>();
  Buyer? _buyer = null;
  String _buyerName = "";
  String _buyerSurname = "";
  String _buyerHome = "";
  int _buyerHomePostalCode = 0;
  String _buyerDelivery = "";
  int _buyerDeliveryPostalCode = 0;
  String _buyerPhone = "";
  String _buyerEmail = "";
  TextEditingController _homePostalController = TextEditingController();
  TextEditingController _deliveryPostalController = TextEditingController();

  @override
  void initState() {
    _loadBuyer();
    _loadCities();
  }

  void _loadBuyer() async {
    try {
      final buyer = await _buyerBloc.loadBuyerById(widget.buyerId);
      setState(() {
        _buyerName = buyer.buyerName!;
        _buyerSurname = buyer.buyerSurname!;
        _buyerHome = buyer.buyerHomeAddress!;
        _buyerHomePostalCode = buyer.homePostalCode!;
        _buyerDelivery = buyer.buyerDeliveryAddress!;
        _buyerDeliveryPostalCode = buyer.deliveryPostalCode!;
        _buyerPhone = buyer.buyerPhoneNumber!;
        _buyerEmail = buyer.buyerEmail!;
        _buyer = buyer;
        _homePostalController.text = buyer.homePostalCodeName!;
        _deliveryPostalController.text = buyer.deliveryPostalCodeName!;
      });
    } catch (e) {
      // handle error
    }
  }

  void _loadCities() async {
    try {
      final cities = await _orderBloc.loadAllCity();
      setState(() {
        _cities = cities;
      });
    } catch (e) {
      // handle error
    }
  }

  List<City> _suggestion(String text) {
    return _cities.where((city) {
      return city.cityname
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase());
    }).toList();
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
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _buyerBloc.newBuyer(_buyer!);
                          });
                        },
                        child: Text('Spremi'),
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Ime'),
                    initialValue: _buyerName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite ime kupca';
                      }
                      return null;
                    },
                    onChanged: (value) => {
                      print(value),
                      _buyer = _buyer = _buyer!.copyWith(buyerName: value),
                      print(_buyer!.buyerName)
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Prezime'),
                    initialValue: _buyerSurname,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite prezime kupca';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        _buyer = _buyer!.copyWith(buyerSurname: value),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Broj telefona'),
                    initialValue: _buyerPhone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite broj telefona kupca';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        _buyer = _buyer!.copyWith(buyerPhoneNumber: value),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Adresa stanovanja'),
                    initialValue: _buyerHome,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite adresu stanovanja';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        _buyer = _buyer!.copyWith(buyerHomeAddress: value),
                  ),
                  TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _homePostalController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Grad stanovanja',
                        errorText: null,
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      return _suggestion(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion.cityname!),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        _buyer = _buyer!.copyWith(
                            homePostalCode: suggestion.citypostalcode!);
                        _homePostalController.text = suggestion.cityname!;
                        _buyerHomePostalCode = suggestion.citypostalcode!;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Adresa dostave'),
                    initialValue: _buyerDelivery,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite adresu dostave';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        _buyer = _buyer!.copyWith(buyerDeliveryAddress: value),
                  ),
                  TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _deliveryPostalController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Grad dostave',
                        errorText: null,
                      ),
                    ),
                    suggestionsCallback: (pattern) async {
                      return _suggestion(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion.cityname!),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        _buyer = _buyer!.copyWith(
                            deliveryPostalCode: suggestion.citypostalcode!);
                        _deliveryPostalController.text = suggestion.cityname!;
                        _buyerDeliveryPostalCode = suggestion.citypostalcode!;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    initialValue: _buyerEmail,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unesite email kupca';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        _buyer = _buyer!.copyWith(buyerEmail: value),
                  ),
                ],
              ),
            ))
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
