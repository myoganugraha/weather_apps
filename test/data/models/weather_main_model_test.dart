import 'package:flutter_test/flutter_test.dart';
import 'package:weather_apps/data/models/weather_main_model.dart';

import '__mock__/wather_main_data.dart';

void main() {
  group("Weather main model", () {
    test("should init model data", () {
      // where
      var data = WeatherMainModel.fromJson(mockJson);

      expect(data.feelsLike, mockData.feelsLike);
    });
  });
}
