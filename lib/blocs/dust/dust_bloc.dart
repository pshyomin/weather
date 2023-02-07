import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dust_event.dart';
part 'dust_state.dart';

class DustBloc extends Bloc<DustEvent, DustState> {
  DustBloc() : super(DustInitial()) {
    on<DustEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
