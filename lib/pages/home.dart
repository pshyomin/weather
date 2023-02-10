import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather/blocs/weather/weather_bloc.dart';
import 'package:weather/models/live_day_model.dart';

import '../utils/layout_manager.dart';
import 'weather/widgets/dust.dart';
import 'weather/widgets/sun.dart';
import 'weather/widgets/weather.dart';
import 'weather/widgets/daily.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();

  int skyNumber = 1;
  int ptyNumber = 0;
  String sky = '상태';
  String pty = '';
  WeatherType weatherType = WeatherType.sunny;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ko', null);
    determinePosition();
  }

  void weatherBgInit(LiveDayModel? liveDay) {
    if (liveDay != null) {
      liveDay.response?.body?.items?.item?.forEach(
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
        weatherType = WeatherType.sunny;
        break;
      case 3:
        sky = '구름많음';
        weatherType = WeatherType.cloudy;
        break;
      case 4:
        sky = '흐림';
        weatherType = WeatherType.foggy;
        break;
    }

    switch (ptyNumber) {
      case 0:
        pty = '';
        break;
      case 1:
        pty = '비';
        weatherType = WeatherType.middleRainy;
        break;
      case 2:
        pty = '비/눈';
        weatherType = WeatherType.cloudy;
        break;
      case 3:
        pty = '눈';
        weatherType = WeatherType.middleSnow;
        break;
      case 5:
        pty = '빗방울';
        weatherType = WeatherType.lightRainy;
        break;
      case 6:
        pty = '빗방울눈날림';
        weatherType = WeatherType.lightSnow;
        break;
      case 7:
        pty = '눈날림';
        weatherType = WeatherType.middleSnow;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    LayoutManager layoutManager = LayoutManager(MediaQuery.of(context));
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherEmpty) {
            BlocProvider.of<WeatherBloc>(context).add(const Fetch());
          }
          if (state is WeatherError) {
            return const Center(
              child: Text('데이터를 불러오는 도중 문제가 발생하였습니다.'),
            );
          } else if (state is WeatherLoaded) {
            weatherBgInit(state.weather.liveDay!);
            return Stack(
              children: [
                WeatherBg(
                  weatherType: weatherType,
                  width: layoutManager.getWidth(1),
                  height: layoutManager.getHeight(1),
                ),
                SafeArea(
                  maintainBottomViewPadding: true,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        WeatherView(
                          layoutManager: layoutManager,
                          live: state.weather.live!,
                          liveDay: state.weather.liveDay!,
                          daily: state.weather.daily!,
                          geo: state.weather.geo!,
                        ),
                        DailyView(
                          layoutManager: layoutManager,
                          daily: state.weather.daily!,
                        ),
                        Container(
                          width: layoutManager.getWidth(1),
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: DustView(
                                  layoutManager: layoutManager,
                                  dust: state.weather.dust!,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SunView(
                                  layoutManager: layoutManager,
                                  sun: state.weather.sun!,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            alignment: Alignment.center,
                            width: layoutManager.getWidth(1),
                            height: layoutManager.getHeight(0.05),
                            child: const Text(
                              '오픈 API 출처 - 기상청, 한국환경공단',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Stack(
              children: [
                WeatherBg(
                  weatherType: weatherType,
                  width: layoutManager.getWidth(1),
                  height: layoutManager.getHeight(1),
                ),
                const SafeArea(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 10,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  //GPS 권한 요청 및 위치 정보
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
