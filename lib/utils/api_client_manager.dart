import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/dust_model.dart';
import '../models/radar_model.dart';
import '../models/weather_model.dart';

class APIClientManager {
  final http.Client client;
  APIClientManager({
    required this.client,
  });

  Future<WeatherModel> fetchWeather(DustModel dust, RadarModel radar) async {
    //
    return WeatherModel();
  }

  Future<DustModel> fetchDust() async {
    //
    return DustModel();
  }

  Future<RadarModel> fetchRadar() async {
    //
    return RadarModel();
  }
}
