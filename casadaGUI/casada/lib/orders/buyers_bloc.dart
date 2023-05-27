import 'package:casada/data/buyer.dart';
import 'package:casada/orders/buyer_repository.dart';

class BuyersBloc{
  final _buyerRepository = BuyerRepository();
  Future<Buyer> loadBuyerById(int buyerId) async {
    final buyer = await _buyerRepository.getBuyer(buyerId);
    return buyer;
  }

  
}