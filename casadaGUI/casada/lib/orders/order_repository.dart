import 'package:casada/data/city.dart';
import 'package:casada/data/order_product.dart';

import '../common/Api_Data.dart';
import '../data/buyer.dart';
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

  Future<void> newOrder(
      int oldBuyerId, Buyer buyer, Order order, List<OrderProduct> products) async {
    const apiUrl = '/orderinfo/neworder';
    final formData = {
      'oldBuyerId': oldBuyerId,
      'buyer': buyer.toJson(),
      'order': order.toJson(),
      'products': products.map((product) => product.toJson()).toList(),
    };

    try {
      _apiData.sendData(apiUrl, formData);
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> editOrder(Order order) async {
    const apiUrl = '/orderinfo/update';
    final formData = {
      'order': order.toJson(),
    };

    try {
      _apiData.sendData(apiUrl, formData);
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<List<OrderProduct>> getAllOrderProduct(int orderId) async {
    final response = await _apiData.getData("/orderproduct/$orderId");
    return response.map((json) => OrderProduct.fromJson(json)).toList();
  }

  Future<void> updateProducts(List<OrderProduct> products) async {
    const apiUrl = '/orderproduct/updateproducts';
    final formData = {
      'products': products.map((product) => product.toJson()).toList(),
    };

    try {
      _apiData.sendData(apiUrl, formData);
    } catch (error) {
      print('Error: $error');
    }
  }
}
