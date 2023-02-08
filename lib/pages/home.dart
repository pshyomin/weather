import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';

import '../utils/layout_manager.dart';
import 'weather/widgets/dust.dart';
import 'weather/widgets/radar.dart';
import 'weather/widgets/sun.dart';
import 'weather/widgets/weather.dart';
import 'weather/widgets/week.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    LayoutManager layoutManager = LayoutManager(MediaQuery.of(context));
    return Scaffold(
      body: Stack(
        children: [
          WeatherBg(
            weatherType: WeatherType.cloudy,
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
                  Weather(layoutManager: layoutManager),
                  Week(layoutManager: layoutManager),
                  Container(
                    width: layoutManager.getWidth(1),
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Dust(layoutManager: layoutManager),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Sun(layoutManager: layoutManager),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Radar(layoutManager: layoutManager),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
