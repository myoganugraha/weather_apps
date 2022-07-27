import 'package:kiwi/kiwi.dart';
import 'package:weather_apps/data/datasources/remote/weather_remote_datasource.dart';
import 'package:weather_apps/data/repositories/weather_repository_impl.dart';
import 'package:weather_apps/domain/repositories/weather_repository.dart';
import 'package:weather_apps/domain/usecases/weather_usecase.dart';
import 'package:weather_apps/presentation/cubit/weather/weather_cubit.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer? container;

  static void setup() {
    if (container == null) {
      container ??= KiwiContainer();
      _$Injector().configure();
    }
  }

  static final resolve = container?.resolve;

  void configure() {
    _configureBlocs();
    _configureUsecases();
    _configureRepositories();
    _configureRemoteDatasources();
  }

// ============ BLOCS / CUBITS ============
  @Register.singleton(WeatherCubit)
  void _configureBlocs();

// ============ USECASES ============
  @Register.singleton(WeatherUseCase)
  void _configureUsecases();

// ============ REPOSITORIES ============
  @Register.singleton(
    WeatherRepository,
    from: WeatherRepositoryImpl,
  )
  void _configureRepositories();

// ============ REMOTE DATASOURCES ============
  @Register.singleton(WeatherRemoteDatasource)
  void _configureRemoteDatasources();
}
