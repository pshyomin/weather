import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'radar_event.dart';
part 'radar_state.dart';

class RadarBloc extends Bloc<RadarEvent, RadarState> {
  RadarBloc() : super(RadarInitial()) {
    on<RadarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
