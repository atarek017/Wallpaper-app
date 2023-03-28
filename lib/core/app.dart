import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/resources/routes.dart';
import 'package:wallpaper_app/core/resources/theme_manger.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: getApplicationTheme(),
      themeMode: ThemeMode.dark,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.main,
    );
  }
}
