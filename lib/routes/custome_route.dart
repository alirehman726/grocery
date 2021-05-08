import 'package:flutter/material.dart';
import 'package:main_grocery/pages/BottomBar/bottomnavigation.dart';
import 'package:main_grocery/pages/BottomBar/widget/Category/widget/Detail/detail_page.dart';
import 'package:main_grocery/pages/BottomBar/widget/Category/widget/vegetable_page.dart';
import 'package:main_grocery/pages/splash_screen.dart';
import 'package:main_grocery/routes/route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            builder: (_) => SplachScreen(), settings: settings);
      case categoryProduct:
        return MaterialPageRoute(
            builder: (_) => Vegetable(), settings: settings);

      case productDetail:
        return MaterialPageRoute(
            builder: (_) => DetailPage(), settings: settings);

            case dashboardRoute:
          return MaterialPageRoute(builder: (_) => BottomNavigation(), settings: settings );
    }
  }
}
