import 'package:flutter/material.dart';
import 'package:wonder_souls/src/features/auth/home/presentation/screens/home_screen.dart';
import 'package:wonder_souls/src/features/auth/presentation/screens/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case "/":
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(body: Text("data")),
      );
    case SplashScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SplashScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          body: Center(child: Text('Screen does not exist! ${routeSettings}')),
        ),
      );
  }
}
