import 'dart:async';

import '../common/Api_Data.dart';
import 'package:rxdart/rxdart.dart';

import '../data/product.dart';

class ProductsService {
  final _apiData = ApiData('http://localhost:8080/product');

  Future<List<Product>> loadProducts() async {
    try {
      final response = await _apiData.getData("");
      final products = response.map((json) => Product.fromJson(json)).toList();
      return products;
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
