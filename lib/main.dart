import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'blocs/weather/weather_bloc.dart';
import 'repositorys/weather_repository.dart';
import 'utils/api_client_manager.dart';
import 'utils/router_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  final WeatherRepository weatherRepository = WeatherRepository(
    apiClientManager: APIClientManager(
      client: http.Client(),
    ),
  );
  runApp(MyApp(
    weatherRepository: weatherRepository,
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  final WeatherRepository weatherRepository;
  const MyApp({Key? key, required this.weatherRepository}) : super(key: key);

  @override
  MainState createState() => MainState();
}

class MainState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              WeatherBloc(repository: widget.weatherRepository),
        ),
      ],
      child: MaterialApp.router(
        title: '오늘의 날씨',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: RouterManager.routerConfig(),
      ),
    );
  }
}
