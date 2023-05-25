import 'package:car_park_manager/models/location.dart';

class GeometryModel {
  LocationModel? location;

  GeometryModel({this.location});

  GeometryModel.fromJson(Map<dynamic, dynamic> json) {
    location = json['Location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Location'] = location;
    return data;
  }
}
