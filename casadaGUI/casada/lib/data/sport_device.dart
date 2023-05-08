class SportDevice {
  int? productId;
  String? productName;
  double? productPrice;
  bool? productActiveStatus;
  String? productCode;
  int? sportDeviceTypeId;
  String? sportDeviceTypeName;

  SportDevice(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productActiveStatus,
      this.productCode,
      this.sportDeviceTypeId,
      this.sportDeviceTypeName});

  SportDevice.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productActiveStatus = json['productActiveStatus'];
    productCode = json['productCode'];
    sportDeviceTypeId = json['sportDeviceTypeId'];
    sportDeviceTypeName = json['sportDeviceTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    data['productActiveStatus'] = this.productActiveStatus;
    data['productCode'] = this.productCode;
    data['sportDeviceTypeId'] = this.sportDeviceTypeId;
    data['sportDeviceTypeName'] = this.sportDeviceTypeName;
    return data;
  }
}
