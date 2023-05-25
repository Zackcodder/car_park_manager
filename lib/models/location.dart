class LocationModel {
  double? lat;
  double? lng;

  LocationModel({this.lat, this.lng});

  LocationModel.fromJson(Map<dynamic, dynamic> json) {
    lat = json['Lat'];
    lng = json['Lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Lat'] = lat;
    data['Lng'] = lng;
    return data;
  }
}
