class MassageChair {
  int? productId;
  String? productName;
  double? productPrice;
  bool? productActiveStatus;
  String? productCode;
  int? massageChairClassId;
  String? massageChairClassName;

  MassageChair(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productActiveStatus,
      this.productCode,
      this.massageChairClassId,
      this.massageChairClassName});

  MassageChair.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productActiveStatus = json['productActiveStatus'];
    productCode = json['productCode'];
    massageChairClassId = json['massageChairClassId'];
    massageChairClassName = json['massageChairClassName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    data['productActiveStatus'] = this.productActiveStatus;
    data['productCode'] = this.productCode;
    data['massageChairClassId'] = this.massageChairClassId;
    data['massageChairClassName'] = this.massageChairClassName;
    return data;
  }
}
