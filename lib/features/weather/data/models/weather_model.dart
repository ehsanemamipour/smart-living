import 'package:smart_living/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({required double temperature})
      : super(
          temperature: temperature,
        );
  factory WeatherModel.fromJSON(Map<String, dynamic> mapJSON) {
    return WeatherModel(temperature: mapJSON['current_weather']['temperature']);
  }
}
