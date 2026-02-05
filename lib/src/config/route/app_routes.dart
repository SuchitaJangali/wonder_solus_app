import 'package:flutter/material.dart';
import 'package:wonder_souls/src/features/auth/presentation/screens/boarding_screens.dart';
import 'package:wonder_souls/src/features/home/presentation/screens/home_bottom_bar.dart';
import 'package:wonder_souls/src/features/auth/presentation/screens/splash_screen.dart';
import 'package:wonder_souls/src/features/trips/model/trip.dart';
import 'package:wonder_souls/src/features/trips/presentstion/screens/list_article.dart';
import 'package:wonder_souls/src/features/trips/presentstion/screens/list_destination.dart';
import 'package:wonder_souls/src/features/trips/presentstion/screens/trip_details_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  print("routeSettings ${routeSettings.name}");
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SplashScreen(),
      );
    case HomeBottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeBottomBar(),
      );
    case TripDetailsScreen.routeName:
      var arg = routeSettings.arguments;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TripDetailsScreen(trip: arg as Trip?),
      );
    case BoardingScreens.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BoardingScreens(),
      );
    case ListDestination.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ListDestination(),
      );
    case ListArticle.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ListArticle(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          body: Center(child: Text('Screen does not exist! $routeSettings')),
        ),
      );
  }
}
