import 'package:casada/products/products_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../data/product.dart';

class ProductsBloc {
  final _productsRepository = ProductsRepository();
  final _allProducts = BehaviorSubject<List<Product>>();
  final _massageChairs = BehaviorSubject<List<Product>>();
  final _massageDevices = BehaviorSubject<List<Product>>();
  final _sportsDevices = BehaviorSubject<List<Product>>();

  Stream<List<Product>> get allProductsStream => _allProducts.stream;
  Stream<List<Product>> get massageChairsStream => _massageChairs.stream;
  Stream<List<Product>> get massageDevicesStream => _massageDevices.stream;
  Stream<List<Product>> get sportsDevicesStream => _sportsDevices.stream;

  Future<void> loadAllProducts() async {
    final products = await _productsRepository.getAllProducts();
    _allProducts.sink.add(products);
  }
}
