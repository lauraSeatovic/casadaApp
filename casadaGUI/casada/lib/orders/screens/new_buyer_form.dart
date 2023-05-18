import 'package:flutter/material.dart';

class NewBuyerForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String) onNameChanged; // Callback function to notify parent
  final Function(String) onSurnameChanged;
  final Function(String) onHomeAddressChanged;
  final Function(String) onDeliveryAddressChanged;
  final Function(String) onPhoneNumberChanged;
  final Function(String) onEmailChanged;

  const NewBuyerForm(
      {Key? key,
      required this.formKey,
      required this.onNameChanged,
      required this.onSurnameChanged,
      required this.onHomeAddressChanged,
      required this.onDeliveryAddressChanged,
      required this.onPhoneNumberChanged,
      required this.onEmailChanged})
      : super(key: key);

  @override
  _NewBuyerFormState createState() => _NewBuyerFormState();
}

class _NewBuyerFormState extends State<NewBuyerForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
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
            onChanged: (value) {
              widget.onNameChanged(value); // Notify parent of name change
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Prezime'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Unesite prezime kupca';
              }
              return null;
            },
            onChanged: (value) {
              widget.onSurnameChanged(value); // Notify parent of name change
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Broj telefona'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Unesite broj telefona kupca';
              }
              return null;
            },
            onChanged: (value) {
              widget.onPhoneNumberChanged(value); // Notify parent of name change
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Adresa stanovanja'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Unesite adresu stanovanja';
              }
              return null;
            },
            onChanged: (value) {
              widget.onHomeAddressChanged(value); // Notify parent of name change
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
            onChanged: (value) {
              widget.onDeliveryAddressChanged(value); // Notify parent of name change
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
            onChanged: (value) {
              widget.onEmailChanged(value); // Notify parent of name change
            },
          ),
        ],
      ),
    );
  }
}
