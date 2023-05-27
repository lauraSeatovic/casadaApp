import 'package:casada/data/city.dart';

import '../common/Api_Data.dart';
import '../data/order.dart';
import '../data/payment_method.dart';
import '../data/status.dart';

class OrderRepository {
  final ApiData _apiData = ApiData('http://localhost:8080');
  Future<List<Order>> getAllOrders() async {
    final response = await _apiData.getData("/orderinfo");
    return response.map((json) => Order.fromJson(json)).toList();
  }

  Future<Order> getOrder(int orderId) async {
    final response = await _apiData.getSingleData("/orderinfo/$orderId");
    return Order.fromJson(response);
  }

  Future<void> getOrderPDF(int orderId) async {
    final response = await _apiData.getPDF("/order/pdf/$orderId");
  }

  Future<void> getOrderDispatchPDF(int orderId) async {
    final response = await _apiData.getPDF("/order/pdfdispatch/$orderId");
  }

  Future<String> getOrderHTML(int orderId) async {
    return await _apiData.getHTML("/order/html/$orderId");
  }

  Future<List<City>> getAllCity() async {
    final response = await _apiData.getData("/city");
    return response.map((json) => City.fromJson(json)).toList();
  }

  Future<List<PaymentMethod>> getAllPaymentMethod() async {
    final response = await _apiData.getData("/paymentmethod");
    return response.map((json) => PaymentMethod.fromJson(json)).toList();
  }

  Future<void> deleteOrder(int orderId) {
    return _apiData.deleteData("/orderinfo/${orderId}");
  }

  Future<List<Status>> getAllStatus() async {
    final response = await _apiData.getData("/orderstatus");
    return response.map((json) => Status.fromJson(json)).toList();
  }

  Future<void> changeStatus(int orderId, int statusId) async {
    const apiUrl = '/orderstatus/changestatus';

    final formData = {"orderId": orderId, "newStatusId": statusId};

    _apiData.sendData(apiUrl, formData);

  }
}
