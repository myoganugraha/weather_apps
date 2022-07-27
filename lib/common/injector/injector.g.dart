// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => WeatherCubit(c<WeatherUseCase>()));
  }

  @override
  void _configureUsecases() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => WeatherUseCase(c<WeatherRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<WeatherRepository>(
        (c) => WeatherRepositoryImpl(c<WeatherRemoteDatasource>()));
  }

  @override
  void _configureRemoteDatasources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => WeatherRemoteDatasource());
  }
}
