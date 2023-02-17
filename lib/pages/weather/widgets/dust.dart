import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/models/dust_model.dart';

import '../../../utils/layout_manager.dart';

class DustView extends StatefulWidget {
  final LayoutManager layoutManager;
  final DustModel? dust;
  const DustView({Key? key, required this.layoutManager, required this.dust})
      : super(key: key);

  @override
  DustViewState createState() => DustViewState();
}

class DustViewState extends State<DustView> {
  String? pm10 = '0';
  String? pm25 = '0';
  String? pm10g = '1';
  String? pm25g = '1';
  String? pm10gv = '좋음';
  String? pm25gv = '좋음';

  @override
  void initState() {
    super.initState();
    dustInit();
  }

  void dustInit() {
    pm10 = widget.dust!.response!.body!.items!.first.pm10Value;
    pm25 = widget.dust!.response!.body!.items!.first.pm25Value;

    pm10g = widget.dust!.response!.body!.items!.first.pm10Grade;
    pm25g = widget.dust!.response!.body!.items!.first.pm25Grade;

    switch (pm10g) {
      case '1':
        pm10gv = '좋음';
        break;
      case '2':
        pm10gv = '보통';
        break;
      case '3':
        pm10gv = '나쁨';
        break;
      case '4':
        pm10gv = '매우나쁨';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: widget.layoutManager.getWidth(0.42),
          height: widget.layoutManager.getHeight(0.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withOpacity(0.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    '미세먼지 PM10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$pm10',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '㎍/㎥',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ($pm10gv)',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    '초미세먼지 PM2.5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$pm25',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '㎍/㎥',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ($pm25gv)',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
