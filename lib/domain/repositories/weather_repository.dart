import 'package:weather_apps/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<List<WeatherModel>> getWeatherBasedOnLatLong();
}
