import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_living/core/services/http_service.dart';
import 'package:smart_living/core/utils/network_utils.dart';
import 'package:smart_living/features/weather/data/datasource/weather_remote_datasource.dart';
import 'package:smart_living/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:smart_living/features/weather/domain/repositories/weather_repository.dart';
import 'package:smart_living/features/weather/domain/usecases/fetch_weather.dart';
import 'package:smart_living/features/weather/presentation/bloc/weather_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  _injectExternalLibraries();
  _injectSystemStatus();
  _injectWeather();
}

void _injectWeather() {
  //bloc
  serviceLocator.registerFactory(() => WeatherBloc());
  //usecase
  serviceLocator.registerLazySingleton(() => FetchWeather(repository: serviceLocator()));

  //repositories
  serviceLocator.registerLazySingleton<WeathersRepository>(
    () => WeatherRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
    ),
  );
  //datasources
  serviceLocator.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(httpService: serviceLocator()),
  );
}

void _injectExternalLibraries() {
  serviceLocator.registerLazySingleton<HTTPService>(
    () => DioService(
      dio: Dio(),
    ),
  );
  //Data Connection Checker
  serviceLocator.registerLazySingleton(() => Connectivity());
}

void _injectSystemStatus() {
  // system Statuses
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: serviceLocator()));
}
