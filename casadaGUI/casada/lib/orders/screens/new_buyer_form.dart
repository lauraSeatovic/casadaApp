import 'package:casada/orders/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../data/buyer.dart';
import '../../data/city.dart';

class NewBuyerForm extends StatefulWidget {
  final Buyer buyer;
  final ValueChanged<Buyer> onChanged;
  

  const NewBuyerForm({required this.buyer, required this.onChanged});

  @override
  _NewBuyerFormState createState() => _NewBuyerFormState();
}

class _NewBuyerFormState extends State<NewBuyerForm> {
  TextEditingController _homePostalController = TextEditingController();
  TextEditingController _deliveryPostalController = TextEditingController();
  List<City> _cities = [];
  OrdersBloc _orderBloc = OrdersBloc();

  @override
  void initState() {
    _loadCities();
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
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Ime'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Unesite ime kupca';
              }
              return null;
            },
            onChanged: (value) => widget.onChanged(widget.buyer.copyWith(buyerName: value)),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Prezime'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Unesite prezime kupca';
              }
              return null;
            },
            onChanged: (value) =>
                widget.onChanged(widget.buyer.copyWith(buyerSurname: value)),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Broj telefona'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Unesite broj telefona kupca';
              }
              return null;
            },
            onChanged: (value) =>
                widget.onChanged(widget.buyer.copyWith(buyerPhoneNumber: value)),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Adresa stanovanja'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Unesite adresu stanovanja';
              }
              return null;
            },
            onChanged: (value) =>
                widget.onChanged(widget.buyer.copyWith(buyerHomeAddress: value)),
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
                _homePostalController.text = suggestion.cityname!;
                widget.onChanged(widget.buyer.copyWith(homePostalCode: suggestion.citypostalcode!));
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Adresa dostave'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Unesite adresu dostave';
              }
              return null;
            },
            onChanged: (value) =>
                widget.onChanged(widget.buyer.copyWith(buyerDeliveryAddress: value)),
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
                        _deliveryPostalController.text = suggestion.cityname!;
                        widget.onChanged(widget.buyer.copyWith(deliveryPostalCode: suggestion.citypostalcode));
                      });
                    },
                  ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Unesite email kupca';
              }
              return null;
            },
            onChanged: (value) => widget.onChanged(widget.buyer.copyWith(buyerEmail: value)),
          ),
        ],
      ),
    );
  }
}
