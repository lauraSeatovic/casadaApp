class MassageDevice {
  int? productId;
  String? productName;
  double? productPrice;
  bool? productActiveStatus;
  String? productCode;
  int? massageDeviceTypeId;
  String? massageDeviceTypeName;

  MassageDevice(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productActiveStatus,
      this.productCode,
      this.massageDeviceTypeId,
      this.massageDeviceTypeName});

  MassageDevice.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productActiveStatus = json['productActiveStatus'];
    productCode = json['productCode'];
    massageDeviceTypeId = json['massageDeviceTypeId'];
    massageDeviceTypeName = json['massageDeviceTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    data['productActiveStatus'] = this.productActiveStatus;
    data['productCode'] = this.productCode;
    data['massageDeviceTypeId'] = this.massageDeviceTypeId;
    data['massageDeviceTypeName'] = this.massageDeviceTypeName;
    return data;
  }
}
