import 'package:smart_living/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({required String temperature})
      : super(
          temperature: temperature,
        );
  factory WeatherModel.fromJSON(Map<String, dynamic> mapJSON) {
    return WeatherModel(temperature: mapJSON['temperature']);
  }
}
