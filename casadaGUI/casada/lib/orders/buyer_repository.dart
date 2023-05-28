import 'package:casada/data/buyer.dart';

import '../common/Api_Data.dart';

class BuyerRepository {
  final ApiData _apiData = ApiData('http://localhost:8080');
  Future<Buyer> getBuyer(int buyerId) async {
    final response = await _apiData.getSingleData("/buyer/$buyerId");
    return Buyer.fromJson(response);
  }

  Future<List<Buyer>> getAllBuyer() async {
    final response = await _apiData.getData("/buyer");
    return response.map((json) => Buyer.fromJson(json)).toList();
  }

  Future<void> editBuyer(Buyer buyer) async {
    const apiUrl = '/buyer/update';
    final formData = {
      'buyer': buyer.toJson(),
    };

    try {
      _apiData.sendData(apiUrl, formData);
    } catch (error) {
      print('Error: $error');
    }
  }
}