import 'package:flutter/material.dart';
import 'package:store/common/constants/route_list.dart';
import 'package:store/screens/category/categories.dart';
import 'package:store/screens/home/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;
  static final Map<String, WidgetBuilder> _routes = {
    RouteList.home: (context) => const HomeScreen(),
    RouteList.categories: (context) => const CategoriesScreen(),
  };
}
