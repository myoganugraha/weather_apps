import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:weather_apps/common/utils.dart';
import 'package:weather_apps/domain/entities/weather_entity.dart';
import 'package:weather_apps/presentation/weather/weather_constants.dart';

class WeatherDetailsScreen extends StatelessWidget {
  final WeatherEntity weatherData;
  const WeatherDetailsScreen({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                formattingDate(weatherData.dt, 'EEEE, MMM dd, yyyy'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                formattingDate(weatherData.dt, 'h:mm a'),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${temperatureToCelcius(weatherData.main.temp).toStringAsFixed(1)}°C',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 36,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: WeatherConstants.imageBaseURL +
                        weatherData.weatherProps[0].icon +
                        WeatherConstants.imageSize2x,
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                '${weatherData.weatherProps[0].main} (${weatherData.weatherProps[0].description})',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tempWidget('Temp (min)', weatherData.main.tempMin),
                  tempWidget('Temp (max)', weatherData.main.tempMax)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tempWidget(String title, num temp) => Column(
        children: [
          Text(title),
          Text(
            '${temperatureToCelcius(temp).toStringAsFixed(1)}°C',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      );
}
