import 'package:weather_apps/data/models/weather_main_model.dart';
import 'package:weather_apps/data/models/weather_props_model.dart';
import 'package:weather_apps/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required int dt,
    required WeatherMainModel main,
    required List<WeatherPropsModel> weatherProp,
  }) : super(
          dt: dt,
          main: main,
          weatherProps: weatherProp,
        );

  factory WeatherModel.fromJson(dynamic json) => WeatherModel(
        dt: json['dt'],
        main: WeatherMainModel.fromJson(json['main']),
        weatherProp: (json['weather'] as List<dynamic>)
            .map((data) =>
                WeatherPropsModel.fromJson(data as Map<String, dynamic>))
            .toList(),
      );

  static List<WeatherModel> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => WeatherModel.fromJson(json)).toList();
}
