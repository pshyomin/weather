import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/daily_model.dart';
import '../../../models/daily_view_model.dart';
import '../../../utils/layout_manager.dart';

class DailyView extends StatefulWidget {
  final LayoutManager layoutManager;
  final Daily daily;
  const DailyView({
    Key? key,
    required this.layoutManager,
    required this.daily,
  }) : super(key: key);

  @override
  DailyViewState createState() => DailyViewState();
}

class DailyViewState extends State<DailyView> {
  DateTime dateTime = DateTime.now();
  late List<DailyViewModel> dailyViewData;
  String sky = '';

  @override
  void initState() {
    dailyInit();
    super.initState();
  }

  void dailyInit() {
    dateTime = dateTime.toUtc().add(const Duration(hours: 9));
    dailyViewData = [
      DailyViewModel(
          date: stringDate(dateTime), hour: '${stringHour(dateTime)}00'),
      DailyViewModel(
          date: stringDate(dateTime, const Duration(hours: 1)),
          hour: '${stringHour(dateTime, const Duration(hours: 1))}00'),
      DailyViewModel(
          date: stringDate(dateTime, const Duration(hours: 2)),
          hour: '${stringHour(dateTime, const Duration(hours: 2))}00'),
      DailyViewModel(
          date: stringDate(dateTime, const Duration(hours: 3)),
          hour: '${stringHour(dateTime, const Duration(hours: 3))}00'),
      DailyViewModel(
          date: stringDate(dateTime, const Duration(hours: 4)),
          hour: '${stringHour(dateTime, const Duration(hours: 4))}00'),
      DailyViewModel(
          date: stringDate(dateTime, const Duration(hours: 5)),
          hour: '${stringHour(dateTime, const Duration(hours: 5))}00'),
      DailyViewModel(
          date: stringDate(dateTime, const Duration(hours: 6)),
          hour: '${stringHour(dateTime, const Duration(hours: 6))}00'),
      DailyViewModel(
          date: stringDate(dateTime, const Duration(hours: 7)),
          hour: '${stringHour(dateTime, const Duration(hours: 7))}00'),
      DailyViewModel(
          date: stringDate(dateTime, const Duration(hours: 8)),
          hour: '${stringHour(dateTime, const Duration(hours: 8))}00'),
      DailyViewModel(
          date: stringDate(dateTime, const Duration(hours: 9)),
          hour: '${stringHour(dateTime, const Duration(hours: 9))}00'),
    ];

    for (var element in dailyViewData) {
      for (var element2 in widget.daily.response!.body!.items!.item!) {
        if (element2.fcstDate == element.date &&
            element.hour == element2.fcstTime) {
          if (element2.category! == 'TMP') {
            element.tmn = double.parse(element2.fcstValue!).round();
          }

          if (element2.category! == 'SKY') {
            element.sky = element2.fcstValue!;
          }
          if (element2.category! == 'POP') {
            element.pop = int.parse(element2.fcstValue!);
          }
        }
      }
    }
  }

  String stringHour(DateTime dateTime, [Duration? duration]) {
    if (duration == null) {
      return DateFormat('H').format(dateTime);
    } else {
      return DateFormat('H').format(dateTime.add(duration));
    }
  }

  String stringDate(DateTime dateTime, [Duration? duration]) {
    if (duration == null) {
      return DateFormat('yyyyMMdd').format(dateTime);
    } else {
      return DateFormat('yyyyMMdd').format(dateTime.add(duration));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: widget.layoutManager.getWidth(0.9),
          height: widget.layoutManager.getHeight(0.3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withOpacity(0.2),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.all(5),
            itemCount: dailyViewData.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: widget.layoutManager.getLayoutHeight(0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: widget.layoutManager.getWidth(0.2),
                      child: Text(
                        DateFormat('aa h???', 'ko')
                            .format(
                              dateTime.copyWith(
                                hour: int.parse((dailyViewData[index].hour!)
                                    .substring(0, 2)),
                              ),
                            )
                            .toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          skyData(dailyViewData[index].sky!),
                          Text(
                            '????????? ${dailyViewData[index].pop ?? 0}%',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: widget.layoutManager.getWidth(0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${dailyViewData[index].tmn ?? 0}??',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.white38,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget skyData(String num) {
    Icon skyIcon = const Icon(
      CupertinoIcons.sun_max_fill,
      color: Colors.white,
    );
    switch (num) {
      case '1':
        sky = '???';
        skyIcon = const Icon(
          CupertinoIcons.cloud_rain_fill,
          color: Colors.white,
        );
        break;
      case '2':
        sky = '???/???';
        skyIcon = const Icon(
          CupertinoIcons.cloud_rain_fill,
          color: Colors.white,
        );
        break;
      case '3':
        sky = '???';
        skyIcon = const Icon(
          CupertinoIcons.cloud_snow_fill,
          color: Colors.white,
        );
        break;
      case '4':
        sky = '?????????';
        skyIcon = const Icon(
          CupertinoIcons.cloud_sun_rain_fill,
          color: Colors.white,
        );
        break;
      default:
        sky = '';
        skyIcon = const Icon(
          CupertinoIcons.sun_max_fill,
          color: Colors.white,
        );
        break;
    }
    return Column(children: [
      skyIcon,
      Expanded(
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            sky,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ]);
  }
}
