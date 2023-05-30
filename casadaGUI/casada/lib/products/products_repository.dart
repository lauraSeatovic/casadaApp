import 'package:casada/data/massage_chair.dart';
import 'package:casada/data/massage_device.dart';
import 'package:casada/data/sport_device.dart';

import '../common/Api_Data.dart';
import '../data/massage_chair_class.dart';
import '../data/product.dart';

class ProductsRepository {
  final ApiData _apiData = ApiData('http://localhost:8080');
  List<Product> _allProducts = [];
  List<MassageChair> _massageChairs = [];
  List<MassageDevice> _massageDevices = [];
  List<SportDevice> _sportsDevices = [];
  List<MassageChairClass> _massageChairClasses = [];

  Future<List<Product>> loadProducts() async {
    try {
      final response = await _apiData.getData("/product");
      final products = response.map((json) => Product.fromJson(json)).toList();
      return products;
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<List<Product>> getAllProducts() async {
    if (_allProducts.isEmpty) {
      final response = await _apiData.getData("/product");
      _allProducts = response.map((json) => Product.fromJson(json)).toList();
    }
    return _allProducts;
  }

  Future<List<MassageChair>> getAllMassageChairs() async {
    if (_massageChairs.isEmpty) {
      final response = await _apiData.getData("/product/massagechair");
      _massageChairs =
          response.map((json) => MassageChair.fromJson(json)).toList();
    }
    return _massageChairs;
  }

  Future<List<MassageDevice>> getAllMassageDevices() async {
    if (_massageDevices.isEmpty) {
      final response = await _apiData.getData("/product/massagedevice");
      _massageDevices =
          response.map((json) => MassageDevice.fromJson(json)).toList();
    }
    return _massageDevices;
  }

  Future<List<SportDevice>> getAllSportDevice() async {
    if (_sportsDevices.isEmpty) {
      final response = await _apiData.getData("/product/sportdevice");
      _sportsDevices =
          response.map((json) => SportDevice.fromJson(json)).toList();
    }
    return _sportsDevices;
  }

  Future<List<MassageChairClass>> getAllMassageChairClass() async {
    if (_massageChairClasses.isEmpty) {
      final response = await _apiData.getData("/massagechair/class");
      _massageChairClasses =
          response.map((json) => MassageChairClass.fromJson(json)).toList();
    }
    return _massageChairClasses;
  }

  Future<void> addMassageChair(String? name, String? price, String? productCode,
      int? classId, bool isActive) async {
    const apiUrl = '/product/massagechair';

    final formData = {
      "productDTO": {
        "productId": 0,
        "productName": name,
        "productPrice": price,
        "productActiveStatus": isActive,
        "productCode": productCode
      },
      "massageChairClassId": classId
    };

    _apiData.sendData(apiUrl, formData);
  }

  Future<void> editMassageChair(int? productId, String? name, String? price, String? productCode,
      int? classId, bool isActive) async {
    const apiUrl = '/product/massagechair/edit';

    final formData = {
      "productDTO": {
        "productId": productId,
        "productName": name,
        "productPrice": price,
        "productActiveStatus": isActive,
        "productCode": productCode
      },
      "massageChairClassId": classId
    };

    _apiData.sendData(apiUrl, formData);
  }

  Future<void> deleteProduct(int productId){
    return _apiData.deleteData("/product/${productId}");
  }
}
