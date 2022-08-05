import 'package:weather_apps/data/models/weather_main_model.dart';

var mockData = WeatherMainModel(
  feelsLike: 200,
  temp: 210,
  tempMax: 300,
  tempMin: 200,
);

Map<String, dynamic> mockJson = {
  "temp": 210,
  "feels_like": 200,
  "temp_max": 300,
  "temp_min": 200,
};
