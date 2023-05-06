import 'package:casada/data/massage_chair.dart';
import 'package:casada/data/massage_device.dart';
import 'package:casada/data/sport_device.dart';
import 'package:casada/products/screens/all_products_table.dart';
import 'package:casada/products/screens/massage_chairs_table.dart';
import 'package:casada/products/screens/massage_device_table.dart';
import 'package:casada/products/products_bloc.dart';
import 'package:casada/products/screens/sport_device_table.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/product.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
      await _productsBloc.loadAllMassageChairs();
      await _productsBloc.loadAllMassageDevice();
      await _productsBloc.loadAllSportDevice();
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
      case 1:
        return StreamBuilder<List<MassageChair>>(
          stream: _productsBloc.massageChairsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MassageChairTable(data: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      case 2:
        return StreamBuilder<List<MassageDevice>>(
          stream: _productsBloc.massageDevicesStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MassageDeviceTable(data: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      case 3:
        return StreamBuilder<List<SportDevice>>(
          stream: _productsBloc.sportsDevicesStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SportDeviceTable(data: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      default:
        return Container();
    }
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