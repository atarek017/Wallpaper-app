import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/feature/home/domain/entity/response_entity/photo_response.dart';

import '../../feature/full_screen/presentation/screens/full_image_screen.dart';
import '../../feature/main/presentation/screens/main_screen.dart';
import 'app_strings.dart';

class Routes {
  static const String main = "/";
  static const String fullImageScreen = "/fullImageScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:

        /// main
        return MaterialPageRoute(builder: (_) => const MainScreen());

        /// full image screen
      case Routes.fullImageScreen:
        final photoEntity = settings.arguments as PhotoEntity;
        return MaterialPageRoute(
            settings: const RouteSettings(name: Routes.fullImageScreen),
            builder: (_) => FullImageScreen(
              photoEntity: photoEntity,
            ));

      ///default
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound),
        ),
        body: Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
