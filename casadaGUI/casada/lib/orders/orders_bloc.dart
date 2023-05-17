import 'package:casada/data/order.dart';
import 'package:casada/orders/orders_repository.dart';
import 'package:rxdart/rxdart.dart';

class OrdersBloc{
  final _orderRepository = OrderRepository();
  final _allOrders = BehaviorSubject<List<Order>>();

  Stream<List<Order>> get allOrdersStream => _allOrders.stream;
  
  Future<void> loadAllOrders() async {
    final orders = await _orderRepository.getAllOrders();
    _allOrders.sink.add(orders);
  }
}