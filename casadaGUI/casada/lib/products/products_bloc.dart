import 'package:casada/data/massage_chair.dart';
import 'package:casada/data/massage_device.dart';
import 'package:casada/data/sport_device.dart';
import 'package:casada/products/products_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../data/product.dart';

class ProductsBloc {
  final _productsRepository = ProductsRepository();
  final _allProducts = BehaviorSubject<List<Product>>();
  final _massageChairs = BehaviorSubject<List<MassageChair>>();
  final _massageDevices = BehaviorSubject<List<MassageDevice>>();
  final _sportsDevices = BehaviorSubject<List<SportDevice>>();

  Stream<List<Product>> get allProductsStream => _allProducts.stream;
  Stream<List<MassageChair>> get massageChairsStream => _massageChairs.stream;
  Stream<List<MassageDevice>> get massageDevicesStream => _massageDevices.stream;
  Stream<List<SportDevice>> get sportsDevicesStream => _sportsDevices.stream;

  Future<void> loadAllProducts() async {
    final products = await _productsRepository.getAllProducts();
    _allProducts.sink.add(products);
  }

  Future<void> loadAllMassageChairs() async {
    final products = await _productsRepository.getAllMassageChairs();
    _massageChairs.sink.add(products);
  }

  Future<void> loadAllMassageDevice() async {
    final products = await _productsRepository.getAllMassageDevices();
    _massageDevices.sink.add(products);
  }

  Future<void> loadAllSportDevice() async {
    final products = await _productsRepository.getAllSportDevice();
    _sportsDevices.sink.add(products);
  }
}