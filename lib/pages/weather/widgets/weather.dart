import 'package:flutter/material.dart';
import 'package:weather/models/geo_model.dart';
import 'package:weather/models/live_day_model.dart';

import '../../../models/daily_model.dart';
import '../../../models/live_model.dart';
import '../../../utils/layout_manager.dart';

class WeatherView extends StatefulWidget {
  final LayoutManager layoutManager;
  final Live? live;
  final LiveDayModel? liveDay;
  final Daily? daily;
  final GeoModel? geo;
  const WeatherView(
      {Key? key,
      required this.layoutManager,
      required this.live,
      required this.liveDay,
      required this.daily,
      required this.geo})
      : super(key: key);

  @override
  WeatherViewState createState() => WeatherViewState();
}

class WeatherViewState extends State<WeatherView> {
  int ondo = 0;
  int mnOndo = 0;
  int mxOndo = 0;
  int skyNumber = 1;
  int ptyNumber = 0;
  String sky = '상태';
  String pty = '';

  @override
  void initState() {
    super.initState();
    weatherInit();
  }

  void weatherInit() {
    if (widget.live != null) {
      widget.live!.response!.body?.items?.item?.forEach(
        (element) {
          if (element.category == 'T1H') {
            ondo = double.parse(element.obsrValue!).round();
          }
        },
      );
    }

    if (widget.daily != null) {
      widget.daily!.response?.body?.items?.item?.forEach(
        (element) {
          if (element.category == 'TMN') {
            mnOndo = double.parse(element.fcstValue!).round();
          }
          if (element.category == 'TMX') {
            mxOndo = double.parse(element.fcstValue!).round();
          }
        },
      );
    }

    if (widget.liveDay != null) {
      widget.liveDay!.response?.body?.items?.item?.forEach(
        (element) {
          if (element.category == 'SKY') {
            skyNumber = int.parse(element.fcstValue!);
          }
          if (element.category == 'PTY') {
            ptyNumber = int.parse(element.fcstValue!);
          }
        },
      );
    }

    switch (skyNumber) {
      case 1:
        sky = '맑음';
        break;
      case 3:
        sky = '구름많음';
        break;
      case 4:
        sky = '흐림';
        break;
    }

    switch (ptyNumber) {
      case 0:
        pty = '';
        break;
      case 1:
        pty = '비';
        break;
      case 2:
        pty = '비/눈';
        break;
      case 3:
        pty = '눈';
        break;
      case 5:
        pty = '빗방울';
        break;
      case 6:
        pty = '빗방울눈날림';
        break;
      case 7:
        pty = '눈날림';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.layoutManager.getWidth(0.9),
      height: widget.layoutManager.getHeight(0.3),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.geo!.results!.first.region!.area1!.name!} ${widget.geo!.results!.first.region!.area2!.name!}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 10.0,
                  color: Color.fromARGB(141, 0, 0, 0),
                ),
              ],
            ),
          ),
          Text(
            '$ondo°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 64,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, 0),
                  blurRadius: 10.0,
                  color: Color.fromARGB(141, 0, 0, 0),
                ),
              ],
            ),
          ),
          Text(
            pty == '' ? sky : pty,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, 0),
                  blurRadius: 10.0,
                  color: Color.fromARGB(174, 0, 0, 0),
                ),
              ],
            ),
          ),
          Text(
            '최고:$mxOndo° 최저:$mnOndo°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, 0),
                  blurRadius: 10.0,
                  color: Color.fromARGB(174, 0, 0, 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
