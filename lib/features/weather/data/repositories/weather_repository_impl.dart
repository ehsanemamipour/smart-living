import 'package:dartz/dartz.dart';
import 'package:smart_living/core/errors/errors.dart';
import 'package:smart_living/core/utils/network_utils.dart';
import 'package:smart_living/core/utils/repository_utils.dart';
import 'package:smart_living/features/weather/data/datasource/weather_remote_datasource.dart';
import 'package:smart_living/features/weather/domain/entities/weather.dart';
import 'package:smart_living/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeathersRepository {
  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, Weather>> fetchWeather() async {
    return requestToServer(
      await networkInfo.hasConnection,
      () => remoteDataSource.fetchWeather(),
    );
  }
}
