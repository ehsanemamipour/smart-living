import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class GetWeatherInfoState extends WeatherState {
  const GetWeatherInfoState({required this.temperature});
  final String temperature;
  @override
  List<Object> get props => [temperature];
}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {
  const WeatherError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
