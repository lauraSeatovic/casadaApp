class Product {
  int? productId;
  String? productName;
  double? productPrice;
  bool? productActiveStatus;
  String? productCode;

  Product(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productActiveStatus,
      this.productCode});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productActiveStatus = json['productActiveStatus'];
    productCode = json['productCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    data['productActiveStatus'] = this.productActiveStatus;
    data['productCode'] = this.productCode;
    return data;
  }
}