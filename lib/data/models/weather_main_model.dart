import 'package:weather_apps/domain/entities/weather_main_entity.dart';

class WeatherMainModel extends WeatherMainEntity {
  WeatherMainModel({
    required num temp,
    required num tempMin,
    required num tempMax,
    required num feelsLike,
  }) : super(
          temp: temp,
          tempMin: tempMin,
          tempMax: tempMax,
          feelsLike: feelsLike,
        );
  
  factory WeatherMainModel.fromJson(dynamic json) => WeatherMainModel(
        temp: json['temp'],
        tempMin: json['temp_min'],
        tempMax: json['temp_max'],
        feelsLike: json['feels_like'],
      );
}
