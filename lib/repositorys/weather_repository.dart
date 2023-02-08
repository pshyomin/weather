import '../models/dust_model.dart';
import '../models/radar_model.dart';
import '../models/weather_model.dart';
import '../utils/api_client_manager.dart';

class WeatherRepository {
  final APIClientManager apiClientManager;
  WeatherRepository({required this.apiClientManager});

  Future<WeatherModel> fetchWeather(DustModel dust, RadarModel radar) async {
    return await apiClientManager.fetchWeather(dust, radar);
  }

  Future<DustModel> fetchDust() async {
    return await apiClientManager.fetchDust();
  }

  Future<RadarModel> fetchRadar() async {
    return await apiClientManager.fetchRadar();
  }
}
