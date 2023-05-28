import 'package:casada/data/order.dart';
import 'package:casada/data/order_product.dart';
import 'package:casada/orders/order_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../data/buyer.dart';
import '../data/city.dart';
import '../data/payment_method.dart';
import '../data/status.dart';

class OrdersBloc {
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

  void getOrderPDF(int orderId) async {
    final order = await _orderRepository.getOrderPDF(orderId);
  }

  void getOrderDispatchPDF(int orderId) async {
    final order = await _orderRepository.getOrderDispatchPDF(orderId);
  }

  Future<String> getOrderHTML(int orderId) async {
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

  Future<List<Status>> loadAllStatus() async {
    final status = await _orderRepository.getAllStatus();
    return status;
  }

  void deleteOrder(int orderId) {
    _orderRepository.deleteOrder(orderId);
  }

  void changeStatus(int orderId, int statusId) {
    _orderRepository.changeStatus(orderId, statusId);
  }

  void newOrder(Buyer buyer, Order order, List<OrderProduct> orderProduct) {
    _orderRepository.newOrder(buyer, order, orderProduct);
  }
}
