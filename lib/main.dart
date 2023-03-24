import 'package:flutter/cupertino.dart';
import 'package:trackify/screens/dashboard_screen.dart';
import 'package:trackify/screens/tracking_screen.dart';

import 'screens/registration_screen.dart';

void main() {
  runApp(const Trackify());
}

class Trackify extends StatelessWidget {
  const Trackify({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: const RegistrationScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        debugPrint('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          '/registration': (BuildContext context) => const RegistrationScreen(),
          '/dashBoard': (BuildContext context) => const DashBoard(),
          '/tracking': (BuildContext context) => const Tracking(),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return CupertinoPageRoute(
          builder: (ctx) => builder(ctx),
        );
      },
    );
  }
}
