import 'package:weather_apps/data/models/weather_model.dart';
import 'package:weather_apps/domain/repositories/weather_repository.dart';

class WeatherUseCase {
  final WeatherRepository weatherRepository;

  WeatherUseCase(this.weatherRepository);

  Future<List<WeatherModel>> getWeatherBasedOnLatLong() async {
    return weatherRepository.getWeatherBasedOnLatLong();
  }
}
