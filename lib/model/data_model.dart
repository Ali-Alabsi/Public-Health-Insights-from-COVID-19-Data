import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
class ApiService {
  final String baseUrl = 'http://192.168.101.189/Public-Health-Insights-from-COVID-19-Data/getData.php'; // استبدل هذا بعنوان الـ IP الحقيقي

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}



class Country {
  final String name;
  final LatLngBounds bounds;

  Country({required this.name, required this.bounds});

  factory Country.fromJson(Map<String, dynamic> json) {
    final coordinates = json['coordinates'];
    final southWest = LatLng(coordinates[0][1], coordinates[0][0]);
    final northEast = LatLng(coordinates[1][1], coordinates[1][0]);
    return Country(name: json['name'], bounds: LatLngBounds(southWest, northEast));
  }

  bool contains(LatLng point) {
    return bounds.contains(point);
  }
}