import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:flutter/services.dart';
import 'package:store/common/configs/general.dart';
import 'package:store/modules/dynamic_layout/configs/app_config.dart';

class AppModel extends ChangeNotifier {
  AppConfig? appConfig;

  Future<AppConfig?> loadAppConfig({Map<String, dynamic>? config}) async {
    var path = 'lib/config/config.json';
    try {
      final appJson = await rootBundle.loadString(path);
      appConfig = AppConfig.fromJson(convert.jsonDecode(appJson));
    } catch (e) {
      final appJson = await rootBundle.loadString(kAppConfig);
      appConfig = AppConfig.fromJson(convert.jsonDecode(appJson));
    }
    return appConfig;
  }
}
