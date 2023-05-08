import 'package:casada/data/massage_chair.dart';
import 'package:casada/data/massage_device.dart';
import 'package:casada/data/sport_device.dart';

import '../common/Api_Data.dart';
import '../data/product.dart';

class ProductsRepository {
  final ApiData _apiData = ApiData('http://localhost:8080/product');
  List<Product> _allProducts = [];
  List<MassageChair> _massageChairs = [];
  List<MassageDevice> _massageDevices = [];
  List<SportDevice> _sportsDevices = [];

  Future<List<Product>> loadProducts() async {
    try {
      final response = await _apiData.getData("");
      final products = response.map((json) => Product.fromJson(json)).toList();
      return products;
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<List<Product>> getAllProducts() async {
    if (_allProducts.isEmpty) {
      final response = await _apiData.getData("");
      _allProducts = response.map((json) => Product.fromJson(json)).toList();
    }
    return _allProducts;
  }

  Future<List<MassageChair>> getAllMassageChairs() async {
    if (_massageChairs.isEmpty) {
      final response = await _apiData.getData("/massagechair");
      _massageChairs = response.map((json) => MassageChair.fromJson(json)).toList();
    }
    return _massageChairs;
  }

  Future<List<MassageDevice>> getAllMassageDevices() async {
    if (_massageDevices.isEmpty) {
      final response = await _apiData.getData("/massagedevice");
      _massageDevices = response.map((json) => MassageDevice.fromJson(json)).toList();
    }
    return _massageDevices;
  }

  Future<List<SportDevice>> getAllSportDevice() async {
    if (_sportsDevices.isEmpty) {
      final response = await _apiData.getData("/sportdevice");
      _sportsDevices = response.map((json) => SportDevice.fromJson(json)).toList();
    }
    return _sportsDevices;
  }

}
