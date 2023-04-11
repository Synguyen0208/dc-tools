import 'package:flutter/material.dart';
import 'package:store/common/constants/route_list.dart';
import 'package:store/menu/main_tab.dart';
import 'package:store/screens/category/categories.dart';
import 'package:store/screens/error_screen.dart';
import 'package:store/screens/home/home_screen.dart';
import 'package:store/screens/product/product_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;
  static final Map<String, WidgetBuilder> _routes = {
    RouteList.dashboard: (context) => const MainTab(),
    RouteList.home: (context) => const HomeScreen(),
    RouteList.categories: (context) => const CategoriesScreen(),
    RouteList.product: (context) {
      ProductArgument? data =
          ModalRoute.of(context)?.settings.arguments as ProductArgument?;
      return ProductScreen(
        categoryId: data?.categoryId,
        sortBy: data?.sortBy,
        title: data?.title,
      );
    },
    "/error": (context) {
      ErrorArguments? data =
          ModalRoute.of(context)?.settings.arguments as ErrorArguments?;
      return ErrorScreen(
        title: data?.title,
        message: data?.message,
      );
    },
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
      case RouteList.product:
        ProductArgument? data = settings.arguments as ProductArgument?;
        return _buildRoute(
          settings,
          (_) => ProductScreen(
            categoryId: data?.categoryId,
            sortBy: data?.sortBy,
          ),
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
