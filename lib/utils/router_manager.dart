import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/weather/weather_bloc.dart';
import '../pages/home.dart';

class RouterManager {
  static GoRouter routerConfig() {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return BlocProvider(
              create: (_) => WeatherBloc(),
              child: Home(),
            );
          },
        ),
      ],
    );
  }
}
