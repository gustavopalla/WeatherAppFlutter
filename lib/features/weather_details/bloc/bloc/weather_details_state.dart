part of 'weather_details_bloc.dart';

sealed class WeatherDetailsState extends Equatable {
  const WeatherDetailsState();
  
  @override
  List<Object> get props => [];
}

final class WeatherDetailsInitial extends WeatherDetailsState {}
