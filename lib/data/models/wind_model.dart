import 'package:weather_apps/domain/entities/wind_entity.dart';

class WindModel extends WindEntity {
  WindModel({
    required num speed,
    required num degree,
    required num gust,
  }) : super(speed: speed, degree: degree, gust: gust);

  factory WindModel.fromJson(dynamic json) => WindModel(
        speed: json['speed'],
        degree: json['deg'],
        gust: json['gust'],
      );
}
