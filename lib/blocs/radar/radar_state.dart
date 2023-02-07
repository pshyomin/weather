part of 'radar_bloc.dart';

abstract class RadarState extends Equatable {
  const RadarState();
  
  @override
  List<Object> get props => [];
}

class RadarInitial extends RadarState {}
