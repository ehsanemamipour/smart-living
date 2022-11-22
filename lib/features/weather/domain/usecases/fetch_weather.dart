import 'package:dartz/dartz.dart';
import 'package:smart_living/core/errors/errors.dart';
import 'package:smart_living/core/utils/usecase_utils.dart';
import 'package:smart_living/features/weather/domain/entities/weather.dart';
import 'package:smart_living/features/weather/domain/repositories/weather_repository.dart';

class FetchWeather implements UseCase<Weather, NoParams> {
  FetchWeather({required this.repository});
  final WeathersRepository repository;

  @override
  Future<Either<Failure, Weather>> call(params) {
    return repository.fetchWeather();
  }
}
