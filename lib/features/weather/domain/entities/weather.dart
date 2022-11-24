import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.temperature,
  });

  final double? temperature;

  @override
  List<Object?> get props => [temperature];
}
