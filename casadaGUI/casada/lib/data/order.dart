import 'dart:ffi';

class Order {
  int? orderId;
  DateTime? orderDate;
  bool? personalPickup;
  String? orderNote;
  int? deliveryPersonId;
  String? deliveryPersonName;
  String? deliveryPersonSurname;
  int? sellerId;
  String? sellerName;
  String? sellerSurname;
  int? buyerId;
  String? buyerName;
  String? buyerSurname;
  int? orderStatusId;
  String? orderStatusName;
  int? paymentMethodId;
  String? paymentMethodName;
  String? deliveryDate;
  double? orderDiscount;
  String? otherPayment;
  double? orderDeposit;
  bool? isFullPaid;
  String? orderNumber;
  bool? orderStatusNotifications;

  Order(
      {this.orderId,
      this.orderDate,
      this.personalPickup,
      this.orderNote,
      this.deliveryPersonId,
      this.deliveryPersonName,
      this.deliveryPersonSurname,
      this.sellerId,
      this.sellerName,
      this.sellerSurname,
      this.buyerId,
      this.buyerName,
      this.buyerSurname,
      this.orderStatusId,
      this.orderStatusName,
      this.paymentMethodId,
      this.paymentMethodName,
      this.deliveryDate,
      this.orderDiscount,
      this.otherPayment,
      this.orderDeposit,
      this.isFullPaid,
      this.orderNumber,
      this.orderStatusNotifications});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderDate = DateTime.parse(json['orderDate']);
    personalPickup = json['personalPickup'];
    orderNote = json['orderNote'];
    deliveryPersonId = json['deliveryPersonId'];
    deliveryPersonName = json['deliveryPersonName'];
    deliveryPersonSurname = json['deliveryPersonSurname'];
    sellerId = json['sellerId'];
    sellerName = json['sellerName'];
    sellerSurname = json['sellerSurname'];
    buyerId = json['buyerId'];
    buyerName = json['buyerName'];
    buyerSurname = json['buyerSurname'];
    orderStatusId = json['orderStatusId'];
    orderStatusName = json['orderStatusName'];
    paymentMethodId = json['paymentMethodId'];
    paymentMethodName = json['paymentMethodName'];
    deliveryDate = json['deliveryDate'];
    orderDiscount = json['orderDiscount'];
    otherPayment = json['otherPayment'];
    orderDeposit = json['orderDeposit'];
    isFullPaid = json['isFullPaid'];
    orderNumber = json['orderNumber'];
    orderStatusNotifications = json['orderStatusNotifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderDate'] = this.orderDate;
    data['personalPickup'] = this.personalPickup;
    data['orderNote'] = this.orderNote;
    data['deliveryPersonId'] = this.deliveryPersonId;
    data['deliveryPersonName'] = this.deliveryPersonName;
    data['deliveryPersonSurname'] = this.deliveryPersonSurname;
    data['sellerId'] = this.sellerId;
    data['sellerName'] = this.sellerName;
    data['sellerSurname'] = this.sellerSurname;
    data['buyerId'] = this.buyerId;
    data['buyerName'] = this.buyerName;
    data['buyerSurname'] = this.buyerSurname;
    data['orderStatusId'] = this.orderStatusId;
    data['orderStatusName'] = this.orderStatusName;
    data['paymentMethodId'] = this.paymentMethodId;
    data['paymentMethodName'] = this.paymentMethodName;
    data['deliveryDate'] = this.deliveryDate;
    data['orderDiscount'] = this.orderDiscount;
    data['otherPayment'] = this.otherPayment;
    data['orderDeposit'] = this.orderDeposit;
    data['isFullPaid'] = this.isFullPaid;
    data['orderNumber'] = this.orderNumber;
    data['orderStatusNotifications'] = this.orderStatusNotifications;
    return data;
  }

  Order copyWith({
    int? orderId,
    DateTime? orderDate,
    bool? personalPickup,
    String? orderNote,
    int? deliveryPersonId,
    String? deliveryPersonName,
    String? deliveryPersonSurname,
    int? sellerId,
    String? sellerName,
    String? sellerSurname,
    int? buyerId,
    String? buyerName,
    String? buyerSurname,
    int? orderStatusId,
    String? orderStatusName,
    int? paymentMethodId,
    String? paymentMethodName,
    String? deliveryDate,
    double? orderDiscount,
    String? otherPayment,
    double? orderDeposit,
    bool? isFullPaid,
    String? orderNumber,
    bool? orderStatusNotifications,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      orderDate: orderDate ?? this.orderDate,
      personalPickup: personalPickup ?? this.personalPickup,
      orderNote: orderNote ?? this.orderNote,
      deliveryPersonId: deliveryPersonId ?? this.deliveryPersonId,
      deliveryPersonName: deliveryPersonName ?? this.deliveryPersonName,
      deliveryPersonSurname:
          deliveryPersonSurname ?? this.deliveryPersonSurname,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      sellerSurname: sellerSurname ?? this.sellerSurname,
      buyerId: buyerId ?? this.buyerId,
      buyerName: buyerName ?? this.buyerName,
      buyerSurname: buyerSurname ?? this.buyerSurname,
      orderStatusId: orderStatusId ?? this.orderStatusId,
      orderStatusName: orderStatusName ?? this.orderStatusName,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      paymentMethodName: paymentMethodName ?? this.paymentMethodName,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      orderDiscount: orderDiscount ?? this.orderDiscount,
      otherPayment: otherPayment ?? this.otherPayment,
      orderDeposit: orderDeposit ?? this.orderDeposit,
      isFullPaid: isFullPaid ?? this.isFullPaid,
      orderNumber: orderNumber ?? this.orderNumber,
      orderStatusNotifications:
          orderStatusNotifications ?? this.orderStatusNotifications,
    );
  }
}
