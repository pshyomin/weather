import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';

import '../../models/weather_model.dart';
import '../../repositorys/weather_repository.dart';
import '../../utils/GPS.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;
  WeatherBloc({required this.repository}) : super(WeatherEmpty()) {
    on<WeatherEvent>(
      (event, emit) async {
        if (event is Fetch) {
          emit(WeatherLoading());
          try {
            Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high);

            double lat = position.latitude;
            double long = position.longitude;

            final latlong = GPS().convent(Mode.grid, lat, long);

            DateTime currentTime = await NTP.now();
            currentTime = currentTime.toUtc().add(const Duration(hours: 9));
            final baseDate =
                DateFormat("yyyyMMdd").format(currentTime).toString();
            final hour = DateFormat("H").format(currentTime).toString();
            final minute = DateFormat("mm").format(currentTime).toString();

            final geo = await repository.fetchGeocoding(lat, long);
            final dust = await repository
                .fetchDust(geo.results!.first.region!.area1!.alias!);
            final sun = await repository.fetchSun(
                geo.results!.first.region!.area1!.alias!, baseDate);
            final live = await repository.fetchLive(latlong, baseDate, hour);
            final liveDay =
                await repository.fetchLiveDay(latlong, baseDate, hour, minute);
            final daily = await repository.fetchDaily(latlong, baseDate, hour);

            final weather = Weather(
                geo: geo,
                dust: dust,
                live: live,
                liveDay: liveDay,
                daily: daily,
                sun: sun);
            emit(WeatherLoaded(weather: weather));
          } catch (error) {
            emit(WeatherError(message: error.toString()));
          }
        }
      },
    );
  }
}
