import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrder createState() => _NewOrder();
}

class _NewOrder extends State<NewOrder> {
  int _currentStep = 0;


  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
    Step(
      title: Text('Buyer Data'),
      content: Text('Kupac'),
      state: _currentStep == 0 ? StepState.editing : StepState.indexed,
      isActive: _currentStep == 0,
    ),
    Step(
      title: Text('Order Data'),
      content: Text('narudzba'),
      state: _currentStep == 1 ? StepState.editing : StepState.indexed,
      isActive: _currentStep == 1,
    ),
  ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova narudžba'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < steps.length - 1) {
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
            // directly jump to particular step in stepper
            _currentStep = index;
          });
        },
        steps: [
    Step(
      title: Text('Buyer Data'),
      content: Text('Kupac'),
      state: _currentStep == 0 ? StepState.editing : StepState.indexed,
      isActive: _currentStep == 0,
    ),
    Step(
      title: Text('Order Data'),
      content: Text('narudzba'),
      state: _currentStep == 1 ? StepState.editing : StepState.indexed,
      isActive: _currentStep == 1,
    ),
  ],
      ),
    );
  }
}
