import 'package:casada/orders/screens/new_buyer_form.dart';
import 'package:casada/orders/screens/product_catalog_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order_data_form.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrder createState() => _NewOrder();
}

class _NewOrder extends State<NewOrder> {
  int _currentStep = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _buyerName = '';
  String _buyerSurname = '';
  String _buyerHome = '';
  String _buyerDelivery = '';
  String _buyerPhone = '';
  String _buyerEmail = '';

  @override
  Widget build(BuildContext context) {
    final int stepLength = 4;
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova narudžba'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < stepLength - 1) {
              _currentStep++;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep--;
            }
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _currentStep = index;
          });
        },
        steps: [
          Step(
            title: Text('Buyer Data'),
            content: NewBuyerForm(
              formKey: _formKey,
              onNameChanged: (value) {
                setState(() {
                  _buyerName = value;
                });
              },
              onSurnameChanged: (value) {
                setState(() {
                  _buyerSurname = value;
                });
              },
              onHomeAddressChanged: (value) {
                setState(() {
                  _buyerHome = value;
                });
              },
              onDeliveryAddressChanged: (value) {
                setState(() {
                  _buyerDelivery = value;
                });
              },
              onPhoneNumberChanged: (value) {
                setState(() {
                  _buyerPhone = value;
                });
              },
              onEmailChanged: (value) {
                setState(() {
                  _buyerEmail = value;
                });
              },
            ),
            state: _currentStep == 0 ? StepState.editing : StepState.indexed,
            isActive: _currentStep == 0,
          ),
          Step(
            title: Text('Order Data'),
            content: OrderDataForm(),
            state: _currentStep == 1 ? StepState.editing : StepState.indexed,
            isActive: _currentStep == 1,
          ),
          Step(
            title: Text('Products'),
            content: ProductCatalogStep(),
            state: _currentStep == 2 ? StepState.editing : StepState.indexed,
            isActive: _currentStep == 2,
          ),
          Step(
            title: Text('Potvrdi'),
            content: Text('potvrda'),
            state: _currentStep == 3 ? StepState.editing : StepState.indexed,
            isActive: _currentStep == 3,
          ),
        ],
      ),
    );
  }
}
