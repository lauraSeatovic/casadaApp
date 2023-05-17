import '../common/Api_Data.dart';
import '../data/order.dart';

class OrderRepository {
  final ApiData _apiData = ApiData('http://localhost:8080');
  Future<List<Order>> getAllOrders() async {
    final response = await _apiData.getData("/orderinfo");
    return response.map((json) => Order.fromJson(json)).toList();
  }
}
