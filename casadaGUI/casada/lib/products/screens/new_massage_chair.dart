import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMassageChair extends StatefulWidget {
  @override
  _NewMassageChair createState() => _NewMassageChair();
}

class _NewMassageChair extends State<NewMassageChair> {
  bool _isActive = true;
  int _selectedId = 1;
  Map<int, String> itemsMap = {
    1: 'Option 1',
    2: 'Option 2',
    3: 'Option 3',
  };

  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Nova masažna fotelja'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0), // specify the width you want
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Naziv',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cijena',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Šifra',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
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
                items: itemsMap.entries
                    .map((entry) => DropdownMenuItem<int>(
                          value: entry.key,
                          child: Text(entry.value),
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
                    // Process form data
                  }
                },
                child: Text('Dodaj'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
