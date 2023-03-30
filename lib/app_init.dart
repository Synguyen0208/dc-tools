import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:store/common/constants/route_list.dart';
import 'package:store/models/app_model.dart';

class AppInit extends StatefulWidget {
  const AppInit({super.key});

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  AppModel get appModel => Provider.of<AppModel>(context, listen: false);

  Future<void> loadInitAppData() async {
    try {
      await appModel.loadAppConfig();
    } catch (e) {}
  }

  void initApp() async {
    await loadInitAppData();
    FlutterNativeSplash.remove();
    gotoApp();
  }

  void gotoApp() {
    Navigator.pushNamedAndRemoveUntil(
        context, RouteList.dashboard, (route) => false);
  }

  @override
  void initState() {
    super.initState();
    initApp();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
