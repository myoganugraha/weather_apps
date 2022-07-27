import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_apps/data/models/weather_model.dart';
import 'package:weather_apps/domain/usecases/weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherUseCase weatherUseCase;
  WeatherCubit(this.weatherUseCase) : super(WeatherInitial());

  Future<void> getWeatherBasedOnLatLong() async {
    try {
      emit(WeatherIsLoading());
      final data = await weatherUseCase.getWeatherBasedOnLatLong();
      emit(WeatherOnLoaded(data));
    } catch (e) {
      emit(WeatherOnError(e.toString()));
    }
  }
}
