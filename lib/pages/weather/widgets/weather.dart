import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/layout_manager.dart';

class Weather extends StatelessWidget {
  final LayoutManager layoutManager;
  const Weather({Key? key, required this.layoutManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: layoutManager.getWidth(0.9),
      height: layoutManager.getHeight(0.3),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '지역',
            style: TextStyle(
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
            '0°',
            style: TextStyle(
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
            '상태',
            style: TextStyle(
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
            '최고:0° 최저:0°',
            style: TextStyle(
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
