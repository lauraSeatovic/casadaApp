class Status {
  int? orderStatusId;
  String? orderStatusName;

  Status({this.orderStatusId, this.orderStatusName});

  Status.fromJson(Map<String, dynamic> json) {
    orderStatusId = json['orderStatusId'];
    orderStatusName = json['orderStatusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderStatusId'] = this.orderStatusId;
    data['orderStatusName'] = this.orderStatusName;
    return data;
  }
}
