import 'package:weather_apps/domain/entities/weather_props_entity.dart';

class WeatherPropsModel extends WeatherPropsEntity {
  WeatherPropsModel({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) : super(
          id: id,
          main: main,
          description: description,
          icon: icon,
        );

  factory WeatherPropsModel.fromJson(dynamic json) => WeatherPropsModel(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );
}
