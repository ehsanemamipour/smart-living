import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class GetWeatherInfoState extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {
  const WeatherError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
