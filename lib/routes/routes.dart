import 'package:flutter/material.dart';
import 'package:store/common/constants/route_list.dart';
import 'package:store/menu/main_tab.dart';
import 'package:store/screens/category/categories.dart';
import 'package:store/screens/home/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;
  static final Map<String, WidgetBuilder> _routes = {
    RouteList.dashboard: (context) => const MainTab(),
    RouteList.home: (context) => const HomeScreen(),
    RouteList.categories: (context) => const CategoriesScreen(),
  };
  static Route getRouteGenerate(RouteSettings settings) {
    var routingData = settings.name;

    switch (routingData) {
      case RouteList.home:
        return _buildRoute(
          settings,
          (_) => const HomeScreen(),
        );
      case RouteList.categories:
        return _buildRoute(
          settings,
          (_) => const CategoriesScreen(),
        );
      default:
        return _buildRoute(
          settings,
          (_) => const SizedBox(),
        );
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings settings,
    WidgetBuilder builder,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: builder,
    );
  }
}
