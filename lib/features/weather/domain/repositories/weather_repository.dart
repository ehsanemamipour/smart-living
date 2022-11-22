import 'package:dartz/dartz.dart';
import 'package:smart_living/core/errors/errors.dart';
import 'package:smart_living/features/weather/domain/entities/weather.dart';

abstract class WeathersRepository {
  Future<Either<Failure, Weather>> fetchWeather();
}
