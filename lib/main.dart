import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/common/injector/injector.dart';
import 'package:weather_apps/presentation/cubit/weather/weather_cubit.dart';
import 'package:weather_apps/presentation/weather/weather_screen.dart';

Future<void> main() async {
  Injector.setup();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.resolve!<WeatherCubit>()..getWeatherBasedOnLatLong(),
      child: const MaterialApp(
        home:  WeatherScreen(),
      ),
    );
  }
}
