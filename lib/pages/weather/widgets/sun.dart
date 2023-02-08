import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/layout_manager.dart';

class Sun extends StatelessWidget {
  final LayoutManager layoutManager;
  const Sun({Key? key, required this.layoutManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: layoutManager.getWidth(0.42),
          height: layoutManager.getHeight(0.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.5),
          ),
          child: Container(),
        ),
      ),
    );
  }
}
