import 'package:casada/data/order_product.dart';
import 'package:casada/orders/orders_bloc.dart';
import 'package:casada/orders/screens/new_buyer_form.dart';
import 'package:casada/orders/screens/product_catalog_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/buyer.dart';
import '../../data/order.dart';
import 'new_order_data_form.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrder createState() => _NewOrder();
}

class _NewOrder extends State<NewOrder> {
  int _currentStep = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  OrdersBloc ordersBloc = OrdersBloc();
  String _buyerName = '';
  String _buyerSurname = '';
  String _buyerHome = '';
  String _buyerDelivery = '';
  String _buyerPhone = '';
  String _buyerEmail = '';
  int _oldBuyerId = 0;

  Buyer buyer = Buyer();
  Order order = Order();
  List<OrderProduct> products = [];

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
        onStepCancel: _currentStep ==3
          ? null // Disable the "Cancel" button on the last step
          : () {
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
            title: Text('Kupac'),
            content: NewBuyerForm(
              buyer: buyer,
              onChanged: (updatedBuyer) {
                setState(() {
                  buyer = updatedBuyer;
                });
              },
              onChangedOldBuyer: (id){
                _oldBuyerId = id;
              }
            ),
            state: _currentStep == 0 ? StepState.editing : StepState.indexed,
            isActive: _currentStep == 0,
          ),
          Step(
            title: Text('Narudžba'),
            content: NewOrderDataForm(
              order: order,
              onChanged: (updatedOrder) {
                setState(() {
                  order = updatedOrder;
                });
              },
            ),
            state: _currentStep == 1 ? StepState.editing : StepState.indexed,
            isActive: _currentStep == 1,
          ),
          Step(
            title: Text('Products'),
            content: ProductCatalogStep(
                productsList: products,
                onChanged: (newProducts) {
                  setState(() {
                    products = newProducts;
                  });
                }),
            state: _currentStep == 2 ? StepState.editing : StepState.indexed,
            isActive: _currentStep == 2,
          ),
          Step(
            title: Text('Potvrdi'),
            content:  ElevatedButton(
          onPressed: () {
            ordersBloc.newOrder(_oldBuyerId, buyer, order, products);
          },
          child: Text('Submit Data'),
        ),
            state: _currentStep == 3 ? StepState.editing : StepState.indexed,
            isActive: _currentStep == 3,
          ),
        ],

        
      ),
    );
  }
}
