import 'package:flutter/material.dart';

import 'utils/router_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '오늘의 날씨',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: RouterManager.routerConfig(),
    );
  }
}
