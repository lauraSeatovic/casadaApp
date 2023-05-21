import 'package:casada/data/buyer.dart';

import '../common/Api_Data.dart';

class BuyerRepository {
  final ApiData _apiData = ApiData('http://localhost:8080');
  Future<Buyer> getBuyer(int buyerId) async {
    final response = await _apiData.getSingleData("/buyer/$buyerId");
    return Buyer.fromJson(response);
  }
}