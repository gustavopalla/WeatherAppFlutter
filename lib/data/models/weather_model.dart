import 'package:equatable/equatable.dart';

class WeatherModel {
  final String cityName;
  final double temperature;
  final String condition;
  final bool isDayTime;
  final int weatherIcon;
  final DateTime date;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.isDayTime,
    required this.weatherIcon,
    required this.date,
  });

  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
    String localizedName,
  ) {
    return WeatherModel(
      cityName: localizedName,
      temperature: (json['Temperature']['Metric']['Value'] as num).toDouble(),
      condition: json['WeatherText'] ?? '',
      isDayTime: json['IsDayTime'] ?? true,
      weatherIcon: json['WeatherIcon'] ?? 1,
      date: DateTime.parse(json['LocalObservationDateTime']),
    );
  }

  @override
  List<Object?> get props => [
    cityName,
    temperature,
    condition,
    isDayTime,
    weatherIcon,
    date,
  ];
}
