import 'package:car_park_manager/models/geometry.dart';

class PlaceModel {
  String? name;
  double? rating;
  int? userRatingCount;
  String? vicinity;
  GeometryModel? geometry;
  PlaceModel({
    this.geometry,
    this.name,
    this.rating,
    this.userRatingCount,
    this.vicinity,
  });

  PlaceModel.fromJson(Map<String, dynamic> json) {
    geometry = json['Geometry'];
    name = json['Name'];
    rating = json['Rating'];
    userRatingCount = json['user_rating_count'];
    vicinity = json['Vicinity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Geometry'] = geometry;
    data['name'] = name;
    data['Rating'] = rating;
    data['user_rating_count'] = userRatingCount;
    data['Vicinity'] = vicinity;
    return data;
  }
}
