import 'dart:math';

enum Mode {
  grid,
  gps,
}

class GPS {
  Point convent(Mode mode, double lat, double long) {
    double RE = 6371.00877;
    double GRID = 5.0;
    double SLAT1 = 30.0;
    double SLAT2 = 60.0;
    double OLON = 126.0;
    double OLAT = 38.0;
    double XO = 43;
    double YO = 136;

    double degrad = pi / 180.0;
    double raddeg = 180.0 / pi;

    double re = RE / GRID;
    double slat1 = SLAT1 * degrad;
    double slat2 = SLAT2 * degrad;
    double olon = OLON * degrad;
    double olat = OLAT * degrad;

    double sn = tan(pi * 0.25 + slat2 * 0.5) / tan(pi * 0.25 + slat1 * 0.5);
    sn = log(cos(slat1) / cos(slat2)) / log(sn);
    double sf = tan(pi * 0.25 + slat1 * 0.5);
    sf = pow(sf, sn) * cos(slat1) / sn;
    double ro = tan(pi * 0.25 + olat * 0.5);
    ro = re * sf / pow(ro, sn);

    int latd;
    int longd;
    late Point latlong;

    if (mode == Mode.grid) {
      double ra = tan(pi * 0.25 + lat * degrad * 0.5);
      ra = re * sf / pow(ra, sn);
      double theta = long * degrad - olon;
      if (theta > pi) theta -= 2.0 * pi;
      if (theta < -pi) theta += 2.0 * pi;
      theta *= sn;
      latd = (ra * sin(theta) + XO + 0.5).floor();
      longd = (ro - ra * cos(theta) + YO + 0.5).floor();
      latlong = Point(latd, longd);
    } else {
      double xn = lat - XO;
      double yn = ro - long + YO;
      double ra = sqrt(xn * xn + yn * yn);
      if (sn < 0.0) {
        ra = -ra;
      }
      num alat = pow((re * sf / ra), (1.0 / sn));
      alat = 2.0 * atan(alat) - pi * 0.5;

      double theta = 0.0;
      if (xn.abs() <= 0.0) {
        theta = 0.0;
      } else {
        if (yn.abs() <= 0.0) {
          theta = pi * 0.5;
          if (xn < 0.0) {
            theta = -theta;
          }
        } else {
          theta = atan2(xn, yn);
        }
      }
      double alon = theta / sn + olon;
      latlong = Point(alat * raddeg, alon * raddeg);
    }

    return latlong;
  }
}
