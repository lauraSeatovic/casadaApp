import '../common/Api_Data.dart';
import '../data/product.dart';

class ProductsRepository {
  final ApiData _apiData = ApiData('http://localhost:8080/product');
  List<Product> _allProducts = [];
  List<Product> _massageChairs = [];
  List<Product> _massageDevices = [];
  List<Product> _sportsDevices = [];

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

  Future<List<Product>> getMassageChairs() async {
    if (_massageChairs.isEmpty) {
      final response = await _apiData.getData("?category=massage_chair");
      _massageChairs = response.map((json) => Product.fromJson(json)).toList();
    }
    return _massageChairs;
  }

  Future<List<Product>> getMassageDevices() async {
    if (_massageDevices.isEmpty) {
      final response = await _apiData.getData("?category=massage_device");
      _massageDevices = response.map((json) => Product.fromJson(json)).toList();
    }
    return _massageDevices;
  }

  Future<List<Product>> getSportsDevices() async {
    if (_sportsDevices.isEmpty) {
      final response = await _apiData.getData("?category=sports_device");
      _sportsDevices = response.map((json) => Product.fromJson(json)).toList();
    }
    return _sportsDevices;
  }
}
