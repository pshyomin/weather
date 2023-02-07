import 'package:flutter/material.dart';

import '../utils/layout_manager.dart';
import '../utils/theme_manager.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    LayoutManager layoutManager = LayoutManager(MediaQuery.of(context));
    return Scaffold(
      backgroundColor: ThemeManager.themeColor(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('오늘의 날씨'),
        elevation: 0,
        backgroundColor: ThemeManager.themeColor(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            Container(
              width: layoutManager.getWidth(0.9),
              height: layoutManager.getHeight(0.3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
