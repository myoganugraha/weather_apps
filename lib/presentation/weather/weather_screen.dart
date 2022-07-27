import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/common/utils.dart';

import 'package:weather_apps/domain/entities/weather_entity.dart';
import 'package:weather_apps/presentation/cubit/weather/weather_cubit.dart';
import 'package:weather_apps/presentation/weather/weather_constants.dart';
import 'package:weather_apps/presentation/weather_details/weather_details_screen.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Apps'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherIsLoading) {
            return onLoadingWidget();
          } else if (state is WeatherOnError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (state is WeatherOnLoaded) {
            return ListView.separated(
              itemCount: state.weatherData.length,
              separatorBuilder: (_, ind) => const Divider(),
              itemBuilder: (_, i) {
                return weatherItemWidget(context, state.weatherData[i]);
              },
            );
          }
          return onLoadingWidget();
        },
      ),
    );
  }

  Widget onLoadingWidget() => const Center(child: CircularProgressIndicator());

  Widget weatherItemWidget(BuildContext context, WeatherEntity data) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => WeatherDetailsScreen(weatherData: data)),
        );
      },
      leading: CachedNetworkImage(
        imageUrl: WeatherConstants.imageBaseURL +
            data.weatherProps[0].icon +
            WeatherConstants.imageSize2x,
        width: 50,
        height: 100,
      ),
      title: Text(
        formattingDate(data.dt, 'EEE, MMM dd, yyyy h:mm a'),
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 4,
          ),
          Text(
            data.weatherProps[0].main,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Temp: ${temperatureToCelcius(data.main.temp).toStringAsFixed(1)}°C',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
