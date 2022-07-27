import 'package:weather_apps/data/datasources/remote/weather_remote_datasource.dart';
import 'package:weather_apps/data/models/weather_model.dart';
import 'package:weather_apps/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDatasource weatherRemoteDatasource;

  WeatherRepositoryImpl(this.weatherRemoteDatasource);

  @override
  Future<List<WeatherModel>> getWeatherBasedOnLatLong() async {
    return await weatherRemoteDatasource.getWeatherBasedOnLatLong();
  }
}
