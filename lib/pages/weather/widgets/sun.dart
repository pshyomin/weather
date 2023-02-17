import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/sun_model.dart';

import '../../../utils/layout_manager.dart';

class SunView extends StatefulWidget {
  final LayoutManager layoutManager;
  final SunModel? sun;
  const SunView({Key? key, required this.layoutManager, required this.sun})
      : super(key: key);

  @override
  SunViewState createState() => SunViewState();
}

class SunViewState extends State<SunView> {
  DateTime dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    sunInit();
  }

  void sunInit() {
    dateTime = dateTime.toUtc().add(const Duration(hours: 9));
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
                    '일출',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.sunrise_fill,
                    color: Colors.white,
                  ),
                  Text(
                    DateFormat('aa h:mm')
                        .format(
                          dateTime.copyWith(
                            hour: int.parse(widget
                                .sun!.response!.body!.items!.item!.sunrise!
                                .substring(0, 2)),
                            minute: int.parse(
                              widget.sun!.response!.body!.items!.item!.sunrise!
                                  .substring(2, 4),
                            ),
                          ),
                        )
                        .toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    '일몰',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.sunset_fill,
                    color: Colors.white,
                  ),
                  Text(
                    DateFormat('aa h:mm')
                        .format(
                          dateTime.copyWith(
                            hour: int.parse(widget
                                .sun!.response!.body!.items!.item!.sunset!
                                .substring(0, 2)),
                            minute: int.parse(
                              widget.sun!.response!.body!.items!.item!.sunset!
                                  .substring(2, 4),
                            ),
                          ),
                        )
                        .toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
