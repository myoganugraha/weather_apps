import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_apps/data/datasources/remote/constants/weather_remote_datasource_constants.dart';

import 'package:weather_apps/data/models/weather_model.dart';

class WeatherRemoteDatasource {
  Future<List<WeatherModel>> getWeatherBasedOnLatLong() async {
    final result = await http.get(
      Uri.parse(
        '${WeatherRemoteDatasourceConstants.weatherEndpoint}lat=${WeatherRemoteDatasourceConstants.monasLat}&lon=${WeatherRemoteDatasourceConstants.monasLong}&appid=${WeatherRemoteDatasourceConstants.weatherToken}',
      ),
    );
    if (result.statusCode == 200) {
      return WeatherModel.fromJsonList(
        getData(jsonDecode(result.body)),
      );
    }
    return [];
  }
}

dynamic getData(dynamic result) => result['list'];
