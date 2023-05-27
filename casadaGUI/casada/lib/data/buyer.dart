class Buyer {
  int? buyerId;
  String? buyerName;
  String? buyerSurname;
  String? buyerPhoneNumber;
  String? buyerHomeAddress;
  String? buyerDeliveryAddress;
  String? buyerEmail;
  int? homePostalCode;
  String? homePostalCodeName;
  int? deliveryPostalCode;
  String? deliveryPostalCodeName;

  Buyer(
      {this.buyerId,
      this.buyerName,
      this.buyerSurname,
      this.buyerPhoneNumber,
      this.buyerHomeAddress,
      this.buyerDeliveryAddress,
      this.buyerEmail,
      this.homePostalCode,
      this.homePostalCodeName,
      this.deliveryPostalCode,
      this.deliveryPostalCodeName});

  Buyer.fromJson(Map<String, dynamic> json) {
    buyerId = json['buyerId'];
    buyerName = json['buyerName'];
    buyerSurname = json['buyerSurname'];
    buyerPhoneNumber = json['buyerPhoneNumber'];
    buyerHomeAddress = json['buyerHomeAddress'];
    buyerDeliveryAddress = json['buyerDeliveryAddress'];
    buyerEmail = json['buyerEmail'];
    homePostalCode = json['homePostalCode'];
    homePostalCodeName = json['homePostalCodeName'];
    deliveryPostalCode = json['deliveryPostalCode'];
    deliveryPostalCodeName = json['deliveryPostalCodeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buyerId'] = this.buyerId;
    data['buyerName'] = this.buyerName;
    data['buyerSurname'] = this.buyerSurname;
    data['buyerPhoneNumber'] = this.buyerPhoneNumber;
    data['buyerHomeAddress'] = this.buyerHomeAddress;
    data['buyerDeliveryAddress'] = this.buyerDeliveryAddress;
    data['buyerEmail'] = this.buyerEmail;
    data['homePostalCode'] = this.homePostalCode;
    data['homePostalCodeName'] = this.homePostalCodeName;
    data['deliveryPostalCode'] = this.deliveryPostalCode;
    data['deliveryPostalCodeName'] = this.deliveryPostalCodeName;
    return data;
  }

  Buyer copyWith({
    int? buyerId,
    String? buyerName,
    String? buyerSurname,
    String? buyerPhoneNumber,
    String? buyerHomeAddress,
    String? buyerDeliveryAddress,
    String? buyerEmail,
    int? homePostalCode,
    String? homePostalCodeName,
    int? deliveryPostalCode,
    String? deliveryPostalCodeName,
  }) {
    return Buyer(
      buyerId: buyerId ?? this.buyerId,
      buyerName: buyerName ?? this.buyerName,
      buyerSurname: buyerSurname ?? this.buyerSurname,
      buyerPhoneNumber: buyerPhoneNumber ?? this.buyerPhoneNumber,
      buyerHomeAddress: buyerHomeAddress ?? this.buyerHomeAddress,
      buyerDeliveryAddress: buyerDeliveryAddress ?? this.buyerDeliveryAddress,
      buyerEmail: buyerEmail ?? this.buyerEmail,
      homePostalCode: homePostalCode ?? this.homePostalCode,
      homePostalCodeName: homePostalCodeName ?? this.homePostalCodeName,
      deliveryPostalCode: deliveryPostalCode ?? this.deliveryPostalCode,
      deliveryPostalCodeName: deliveryPostalCodeName ?? this.deliveryPostalCodeName,
    );
  }
}
