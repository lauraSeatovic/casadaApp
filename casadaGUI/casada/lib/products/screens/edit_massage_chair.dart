import 'package:casada/data/massage_chair_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../products_bloc.dart';

class EditMassageChair extends StatefulWidget {
  final int productId;
  final String name;
  final String price;
  final String code;
  final int selectedId;
  final bool isActive;

  const EditMassageChair(
      {super.key,
      required this.productId,
      required this.name,
      required this.price,
      required this.code,
      required this.selectedId,
      required this.isActive});

  @override
  _EditMassageChair createState() => _EditMassageChair();
}

class _EditMassageChair extends State<EditMassageChair> {
  final _productsBloc = ProductsBloc();
  List<MassageChairClass> _massageChairClasses = [];

  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _price;
  String? _code;
  int _selectedId = 1;
  bool _isActive = true;

  @override
  void initState() {
    _loadClasses();
  }

  void _loadClasses() async {
    try {
      final massageChairClasses =
          await _productsBloc.loadAllMassageChairClass();
      setState(() {
        _name = widget.name;
        _price = widget.price;
        _code = widget.code;
        _selectedId = widget.selectedId;
        _isActive = widget.isActive;
        _massageChairClasses = massageChairClasses;
      });
    } catch (e) {
      // handle error
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Uredi masažnu fotelju'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0), // specify the width you want
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: widget.name,
                decoration: InputDecoration(
                  labelText: 'Naziv',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Unesite naziv';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                initialValue: widget.price,
                decoration: InputDecoration(
                  labelText: 'Cijena',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Unesite cijenu';
                  }
                  final number = num.tryParse(value);
                  if (number == null) {
                    return "Unesite brojčanu vrijednost";
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = value;
                },
              ),
              TextFormField(
                initialValue: widget.code,
                decoration: InputDecoration(
                  labelText: 'Šifra',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _code = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<int>(
                value: _selectedId,
                onChanged: (value) {
                  setState(() {
                    _selectedId = value!;
                  });
                },
                items: _massageChairClasses
                    .map((entry) => DropdownMenuItem<int>(
                          value: entry.massageChairClassId,
                          child: Text(entry.massageChairClassName!),
                        ))
                    .toList(),
              ),
              Row(
                children: [
                  Text(
                    'Aktivna',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 8.0),
                  Switch(
                    value: _isActive,
                    onChanged: (bool value) {
                      setState(() {
                        _isActive = value;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _productsBloc.editMassageChair(widget.productId, _name,
                        _price, _code, _selectedId, _isActive);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Ažurirana masažna fotelja!'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                child: Text('Promijeni'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
