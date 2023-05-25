import 'package:car_park_manager/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyB-w2L0JpXy-SFvkxe6qE59HF6jxx41200';
  Future<List<PlaceModel>> getPlaces(double lat, double lng) async {
    var response = await http.get(Uri.https(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=10.4418805593, 7.49562339819&type=carpark&rankby=distance&key=$key'));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as List;
    return jsonResult.map((place) => PlaceModel.fromJson(place)).toList();
  }
}
