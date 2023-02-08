import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/weather_model.dart';
import '../../repositorys/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;
  WeatherBloc(this.repository) : super(WeatherInitial()) {
    on<WeatherEvent>(
      (event, emit) async {
        if (event is Fetch) {
          emit(WeatherLoading());
          try {
            final dust = await repository.fetchDust();
            final radar = await repository.fetchRadar();
            final weather = await repository.fetchWeather(dust, radar);
            emit(WeatherLoaded(weather: weather));
          } catch (error) {
            emit(WeatherError(message: error.toString()));
          }
        }
      },
    );
  }
}
