class OrderProduct {
  int? orderid;
  int? productid;
  String? productName;
  double? productPrice;
  double? discount;
  int? guarantee;
  int? quantity;

  OrderProduct(
      {this.orderid,
      this.productid,
      this.productName,
      this.productPrice,
      this.discount,
      this.guarantee,
      this.quantity});

  OrderProduct.fromJson(Map<String, dynamic> json) {
    orderid = json['orderid'];
    productid = json['productid'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    discount = json['discount'];
    guarantee = json['guarantee'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderid'] = this.orderid;
    data['productid'] = this.productid;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    data['discount'] = this.discount;
    data['guarantee'] = this.guarantee;
    data['quantity'] = this.quantity;
    return data;
  }
}