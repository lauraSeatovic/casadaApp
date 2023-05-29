class Service {
  int? serviceId;
  DateTime? serviceStartDate;
  DateTime? serviceFinishDate;
  String? serviceNote;
  double? servicePrice;
  String? orderNumber;
  int? orderId;
  String? productName;
  int? productId;

  Service(
      {this.serviceId,
      this.serviceStartDate,
      this.serviceFinishDate,
      this.serviceNote,
      this.servicePrice,
      this.orderNumber,
      this.orderId,
      this.productName,
      this.productId});

  Service.fromJson(Map<String, dynamic> json) {
    serviceId = json['serviceId'];
    serviceStartDate = DateTime.parse(json['serviceStartDate']);
    serviceFinishDate = DateTime.parse(json['serviceFinishDate']);
    serviceNote = json['serviceNote'];
    servicePrice = json['servicePrice'];
    orderNumber = json['orderNumber'];
    orderId = json['orderId'];
    productName = json['productName'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceId'] = this.serviceId;
    data['serviceStartDate'] = this.serviceStartDate!.toIso8601String();
    data['serviceFinishDate'] = this.serviceFinishDate!.toIso8601String();
    data['serviceNote'] = this.serviceNote;
    data['servicePrice'] = this.servicePrice;
    data['orderNumber'] = this.orderNumber;
    data['orderId'] = this.orderId;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    return data;
  }
}