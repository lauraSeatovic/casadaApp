import 'package:casada/data/order.dart';
import 'package:casada/orders/order_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../data/city.dart';
import '../data/payment_method.dart';

class OrdersBloc{
  final _orderRepository = OrderRepository();
  final _allOrders = BehaviorSubject<List<Order>>();

  Stream<List<Order>> get allOrdersStream => _allOrders.stream;
  
  Future<void> loadAllOrders() async {
    final orders = await _orderRepository.getAllOrders();
    _allOrders.sink.add(orders);
  }

  Future<Order> loadOrderById(int orderId) async {
    final order = await _orderRepository.getOrder(orderId);
    return order;
  }

  void getOrderPDF(int orderId)async {
    final order = await _orderRepository.getOrderPDF(orderId);
  }

  Future<String> getOrderHTML(int orderId)async {
    return await _orderRepository.getOrderHTML(orderId);
  }

  Future<List<City>> loadAllCity() async {
    final classes = await _orderRepository.getAllCity();
    return classes;
  }

  Future<List<PaymentMethod>> loadAllPaymentMethod() async {
    final payment = await _orderRepository.getAllPaymentMethod();
    return payment;
  }
}