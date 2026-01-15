import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';

import '../features/metro/metro_setup_screen.dart';
import '../features/metro/metro_active_screen.dart';

import '../features/vehicle/vehicle_setup_screen.dart';
import '../features/vehicle/vehicle_active_screen.dart';

abstract class AppRoutes {
  static const home = '/';

  static const metroSetup = '/metro/setup';
  static const metroActive = '/metro/active';

  static const vehicleSetup = '/vehicle/setup';
  static const vehicleActive = '/vehicle/active';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _page(const HomeScreen());

      case AppRoutes.metroSetup:
        return _page(const MetroSetupScreen());

      case AppRoutes.metroActive:
        return _page(const MetroActiveScreen());

      case AppRoutes.vehicleSetup:
        return _page(const VehicleSetupScreen());

      case AppRoutes.vehicleActive:
        return _page(const VehicleActiveScreen());

      default:
        return _page(
          const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }

  static PageRoute _page(Widget child) {
    return MaterialPageRoute(
      builder: (_) => child,
    );
  }
}