import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/app_init.dart';
import 'package:store/models/app_model.dart';
import 'package:store/models/categories_model.dart';
import 'package:store/models/product_model.dart';
import 'package:store/routes/routes.dart';
import 'package:store/themes.dart';

class App extends StatefulWidget {
  const App({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppModel>(create: (_) => AppModel()),
        ChangeNotifierProvider<ProductModel>(create: (_) => ProductModel()),
        ChangeNotifierProvider<CategoryModel>(create: (_) => CategoryModel()),
      ],
      child: MaterialApp(
        navigatorKey: App.navigatorKey,
        theme: theme(),
        routes: Routes.getAll(),
        onGenerateRoute: Routes.getRouteGenerate,
        home: const Scaffold(
          body: AppInit(),
        ),
        builder: (_, widget) => Material(child: widget),
      ),
    );
  }
}
