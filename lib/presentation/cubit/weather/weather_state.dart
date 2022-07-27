part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherOnLoaded extends WeatherState {
  final List<WeatherModel> weatherData;

  WeatherOnLoaded(this.weatherData);
}

class WeatherOnError extends WeatherState {
  final String message;

  WeatherOnError(this.message);
}
