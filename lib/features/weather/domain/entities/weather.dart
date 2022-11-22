import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.temperature,
  });

  final String temperature;

  @override
  List<Object?> get props => [temperature];
}
