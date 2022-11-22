import 'package:dio/dio.dart';
import 'package:smart_living/core/consts/consts.dart';
import 'package:smart_living/core/errors/exceptions.dart';
import 'package:smart_living/core/services/http_service.dart';
import 'package:smart_living/features/weather/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> fetchWeather();
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl({required this.httpService});
  final HTTPService httpService;
  @override
  Future<WeatherModel> fetchWeather() async {
    try {
      final result = await httpService.getData(ServerPaths.countris);
      var weather = WeatherModel.fromJSON(result.data);

      return weather;
    } on DioError catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
