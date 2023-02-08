part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends WeatherEvent {
  const Fetch();

  @override
  List<Object> get props => [];
}
