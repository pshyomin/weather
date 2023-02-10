import 'package:weather/models/live_day_model.dart';

import 'daily_model.dart';
import 'dust_model.dart';
import 'geo_model.dart';
import 'live_model.dart';
import 'sun_model.dart';

class Weather {
  GeoModel? geo;
  DustModel? dust;
  Live? live;
  LiveDayModel? liveDay;
  Daily? daily;
  SunModel? sun;
  Weather(
      {required this.geo,
      required this.dust,
      required this.live,
      required this.liveDay,
      required this.daily,
      required this.sun});
}
