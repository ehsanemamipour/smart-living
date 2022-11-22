import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_living/features/weather/presentation/bloc/weather_event.dart';
import 'package:smart_living/features/weather/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>(
      (event, emit) async {
        if (event is GetWeatherInfoEvent) {
          await _onGetWeatherEvent(event, emit);
        }
      },
    );
  }

  Future<void> _onGetWeatherEvent(
    GetWeatherInfoEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    // final result = await getWeather(NoParams());
    // emit(
    //   result.fold(
    //     (error) => SmartError(message: error.message),
    //     (weather) => GetWeatherState(),
    //   ),
    // );
  }
}
