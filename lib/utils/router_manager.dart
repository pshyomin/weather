import 'package:go_router/go_router.dart';

import '../pages/home.dart';

class RouterManager {
  static GoRouter routerConfig() {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return HomePage();
          },
        ),
      ],
    );
  }
}
