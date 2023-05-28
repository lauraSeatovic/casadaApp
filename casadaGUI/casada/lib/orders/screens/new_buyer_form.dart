import 'dart:ffi';

import 'package:casada/orders/buyers_bloc.dart';
import 'package:casada/orders/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../data/buyer.dart';
import '../../data/city.dart';

class NewBuyerForm extends StatefulWidget {
  final Buyer buyer;
  final ValueChanged<Buyer> onChanged;
  final ValueChanged<int> onChangedOldBuyer;

  const NewBuyerForm(
      {required this.buyer,
      required this.onChanged,
      required this.onChangedOldBuyer});

  @override
  _NewBuyerFormState createState() => _NewBuyerFormState();
}

class _NewBuyerFormState extends State<NewBuyerForm> {
  TextEditingController _homePostalController = TextEditingController();
  TextEditingController _deliveryPostalController = TextEditingController();
  TextEditingController _oldBuyerController = TextEditingController();
  List<City> _cities = [];
  List<Buyer> _buyers = [];
  bool _oldBuyer = false;
  OrdersBloc _orderBloc = OrdersBloc();
  BuyersBloc _buyersBloc = BuyersBloc();
  bool _isEditable = true;
  bool _sameDelivery = true;

  @override
  void initState() {
    _loadData();
  }

  void _loadData() async {
    try {
      final cities = await _orderBloc.loadAllCity();
      final buyers = await _buyersBloc.loadAllBuyer();
      setState(() {
        _cities = cities;
        _buyers = buyers;
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

  List<Buyer> _suggestionBuyer(String text) {
    return _buyers.where((buyer) {
      return buyer.buyerName
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          buyer.buyerSurname
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Postojeći kupac',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 8.0),
              Switch(
                value: _oldBuyer,
                onChanged: (bool value) {
                  if (value == false) {
                    widget.onChangedOldBuyer(0);
                  }
                  setState(() {
                    _oldBuyer = value;
                    _isEditable = !value;
                  });
                },
              ),
            ],
          ),
          if (_oldBuyer)
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _oldBuyerController,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'Kupac',
                  errorText: null,
                ),
              ),
              suggestionsCallback: (pattern) async {
                return _suggestionBuyer(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(
                      "${suggestion.buyerName} ${suggestion.buyerSurname}"),
                );
              },
              onSuggestionSelected: (suggestion) {
                setState(() {
                  widget.onChangedOldBuyer(suggestion.buyerId!);
                  _oldBuyerController.text =
                      "${suggestion.buyerName} ${suggestion.buyerSurname}";
                });
              },
            ),
          if (!_oldBuyer)
            TextFormField(
              decoration: InputDecoration(labelText: 'Ime'),
              enabled: _isEditable,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Unesite ime kupca';
                }
                return null;
              },
              onChanged: (value) =>
                  widget.onChanged(widget.buyer.copyWith(buyerName: value)),
            ),
          if (!_oldBuyer)
            TextFormField(
              decoration: InputDecoration(labelText: 'Prezime'),
              enabled: _isEditable,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Unesite prezime kupca';
                }
                return null;
              },
              onChanged: (value) =>
                  widget.onChanged(widget.buyer.copyWith(buyerSurname: value)),
            ),
          if (!_oldBuyer)
            TextFormField(
              decoration: InputDecoration(labelText: 'Broj telefona'),
              enabled: _isEditable,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Unesite broj telefona kupca';
                }
                return null;
              },
              onChanged: (value) => widget
                  .onChanged(widget.buyer.copyWith(buyerPhoneNumber: value)),
            ),
          if (!_oldBuyer)
            TextFormField(
              enabled: _isEditable,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Unesite email kupca';
                }
                return null;
              },
              onChanged: (value) =>
                  widget.onChanged(widget.buyer.copyWith(buyerEmail: value)),
            ),
          if (!_oldBuyer)
            TextFormField(
                decoration: InputDecoration(labelText: 'Adresa stanovanja'),
                enabled: _isEditable,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite adresu stanovanja';
                  }
                  return null;
                },
                onChanged: (value) => {
                      widget.onChanged(
                          widget.buyer.copyWith(buyerHomeAddress: value)),
                      if (_sameDelivery)
                        {
                          widget.onChanged(widget.buyer
                              .copyWith(buyerHomeAddress: value, buyerDeliveryAddress: value))
                        }
                    }),
          if (!_oldBuyer)
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
                  _homePostalController.text = suggestion.cityname!;
                  widget.onChanged(widget.buyer
                      .copyWith(homePostalCode: suggestion.citypostalcode!));
                  if (_sameDelivery) {
                    widget.onChanged(widget.buyer.copyWith(homePostalCode: suggestion.citypostalcode!,
                        deliveryPostalCode: suggestion.citypostalcode!));
                  }
                });
              },
            ),
          if (!_oldBuyer)
            Row(
              children: [
                Text(
                  'Adresa dostave jednaka adresi stanovanja',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 8.0),
                Checkbox(
                  value: _sameDelivery,
                  onChanged: (bool? value) {
                    setState(() {
                      _sameDelivery = value ?? false;
                    });
                  },
                )
              ],
            ),
          if (!_oldBuyer && !_sameDelivery)
            TextFormField(
              decoration: InputDecoration(labelText: 'Adresa dostave'),
              enabled: _isEditable,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Unesite adresu dostave';
                }
                return null;
              },
              onChanged: (value) => widget.onChanged(
                  widget.buyer.copyWith(buyerDeliveryAddress: value)),
            ),
          if (!_oldBuyer && !_sameDelivery)
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
                  _deliveryPostalController.text = suggestion.cityname!;
                  widget.onChanged(widget.buyer
                      .copyWith(deliveryPostalCode: suggestion.citypostalcode));
                });
              },
            ),
        ],
      ),
    );
  }
}
