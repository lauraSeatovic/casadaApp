import 'package:casada/products/all_products_table.dart';
import 'package:casada/products/massage_chairs_table.dart';
import 'package:casada/products/massage_device_table.dart';
import 'package:casada/products/products_bloc.dart';
import 'package:casada/products/products_service.dart';
import 'package:casada/products/sport_device_table.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../common/Api_Data.dart';
import '../data/product.dart';

class Products2 extends StatefulWidget {
  @override
  _Products2State createState() => _Products2State();
}

class _Products2State extends State<Products2> {
  final _productsService = ProductsService();
  final _productsBloc = ProductsBloc();
  int _selectedTable = 0;

  final _allProducts = BehaviorSubject<List<Product>>();

  @override
  void initState() {
    _loadProducts();
  }

  void _loadProducts() async {
    try {
      await _productsBloc.loadAllProducts();
    } catch (e) {
      // handle error
    }
  }

/*
  Future<void> _loadProductsData() async {
    try {
      final allData =  await ApiData('http://localhost:8080/product').getData();
      setState(() {
        _allProducts = allData;
      });
    } catch (e) {
      // handle error
    }
  }

  Future<void> _loadMassageChairData() async {
    try {
      final massageChairData = await ApiData('http://localhost:8080/product/massagechair').getData();
      setState(() {
        _massageChairs = massageChairData;
      });
    } catch (e) {
      // handle error
    }
  }

  Future<void> _loadMassageDeviceData() async {
    try {
      final massageDeviceData = await ApiData('http://localhost:8080/product/massagedevice').getData();
      setState(() {
        _massageDevices = massageDeviceData;
      });
    } catch (e) {
      // handle error
    }
  }

  Future<void> _loadSportsDeviceData() async {
    try {
      final sportsDeviceData = await ApiData('http://localhost:8080/product/sportdevice').getData();
      setState(() {
        _sportsDevices = sportsDeviceData;
      });
    } catch (e) {
      // handle error
    }
  }*/

  Widget _buildTable() {
    switch (_selectedTable) {
      case 0:
        return StreamBuilder<List<Product>>(
          stream: _productsBloc.allProductsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AllProductsTable(data: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      /*
    case 1:
      return _buildTableForFuture(
        future: loadMassageChairs(),
        builder: (data) => MassageChairTable(data: data),
      );
    case 2:
      return _buildTableForFuture(
        future: loadMassageDevices(),
        builder: (data) => MassageDeviceTable(data: data),
      );
    case 3:
      return _buildTableForFuture(
        future: loadSportDevices(),
        builder: (data) => SportDeviceTable(data: data),
      );*/
      default:
        return Container();
    }
  }

  Widget _buildTableForFuture<T>({
    required Future<List<T>> future,
    required Widget Function(List<T>) builder,
  }) {
    return FutureBuilder<List<T>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return builder(snapshot.data!);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Proizvodi',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTable = 0;
                    });
                  },
                  child: Text('Svi proizvodi'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTable = 1;
                    });
                  },
                  child: Text('Masažne fotelje'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTable = 2;
                    });
                  },
                  child: Text('Masažni uređaji'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTable = 3;
                    });
                  },
                  child: Text('Sportski uređaji'),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          _buildTable(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add some functionality here
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
