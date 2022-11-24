import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_living/core/utils/usecase_utils.dart';
import 'package:smart_living/features/weather/domain/usecases/fetch_weather.dart';
import 'package:smart_living/features/weather/presentation/bloc/weather_event.dart';
import 'package:smart_living/features/weather/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required this.fetchWeather}) : super(WeatherInitial()) {
    on<WeatherEvent>(
      (event, emit) async {
        if (event is GetWeatherInfoEvent) {
          await _onGetWeatherEvent(event, emit);
        }
      },
    );
  }
  final FetchWeather fetchWeather;

  Future<void> _onGetWeatherEvent(
    GetWeatherInfoEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    final result = await fetchWeather(NoParams());
    emit(
      result.fold(
        (error) => WeatherError(message: error.message),
        (weather) =>
            GetWeatherInfoState(temperature: weather.temperature.toString()),
      ),
    );
  }
}
