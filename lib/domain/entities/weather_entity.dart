import 'package:weather_apps/domain/entities/weather_main_entity.dart';
import 'package:weather_apps/domain/entities/weather_props_entity.dart';

class WeatherEntity {
  final int dt;
  final WeatherMainEntity main;
  final List<WeatherPropsEntity> weatherProps;

  WeatherEntity({
    required this.dt,
    required this.main,
    required this.weatherProps,
  });
}
