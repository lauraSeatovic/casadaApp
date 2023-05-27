class City {
  int? citypostalcode;
  String? cityname;

  City({this.citypostalcode, this.cityname});

  City.fromJson(Map<String, dynamic> json) {
    citypostalcode = json['citypostalcode'];
    cityname = json['cityname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['citypostalcode'] = this.citypostalcode;
    data['cityname'] = this.cityname;
    return data;
  }
}