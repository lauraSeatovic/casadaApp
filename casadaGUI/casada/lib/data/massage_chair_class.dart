class MassageChairClass {
  int? massageChairClassId;
  String? massageChairClassName;

  MassageChairClass({this.massageChairClassId, this.massageChairClassName});

  MassageChairClass.fromJson(Map<String, dynamic> json) {
    massageChairClassId = json['massageChairClassId'];
    massageChairClassName = json['massageChairClassName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massageChairClassId'] = this.massageChairClassId;
    data['massageChairClassName'] = this.massageChairClassName;
    return data;
  }
}