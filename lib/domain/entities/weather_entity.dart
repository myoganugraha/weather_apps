import 'package:weather_apps/domain/entities/weather_main_entity.dart';
import 'package:weather_apps/domain/entities/weather_props_entity.dart';
import 'package:weather_apps/domain/entities/wind_entity.dart';

class WeatherEntity {
  final int dt;
  final WeatherMainEntity main;
  final List<WeatherPropsEntity> weatherProps;
  final WindEntity windData;

  WeatherEntity({
    required this.dt,
    required this.main,
    required this.weatherProps,
    required this.windData,
  });
}
