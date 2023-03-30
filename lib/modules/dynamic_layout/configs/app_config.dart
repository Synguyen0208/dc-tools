import 'package:store/modules/dynamic_layout/configs/app_settings.dart';

class AppConfig {
  late AppSetting settings;
  List<BottomTabConfig> bottomTab = [];
  dynamic jsonData;
  AppConfig({
    required this.settings,
    required this.bottomTab,
  });

  AppConfig.fromJson(dynamic json) {
    if (json['setting'] != null) {
      settings = AppSetting.fromJson(json['setting']);
    }
    bottomTab = [];
    if (json['bottomTab'] != null) {
      json['bottomTab'].forEach((v) {
        bottomTab.add(BottomTabConfig.fromJson(v));
      });
    }
    jsonData = json;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['bottomTab'] = bottomTab.map((v) => v.toJson()).toList();
    return map;
  }
}

class BottomTabConfig {
  String title = "home";
  String? icon;
  String? activeIcon;
   String? pageName;

  BottomTabConfig({
    this.title = "home",
    this.icon,
    this.activeIcon,
    required this.pageName,
  });

  BottomTabConfig.fromJson(dynamic json) {
    title = json["title"];
    icon = json["icon"];
    activeIcon = json["activeIcon"];
    pageName = json["pageName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = title;
    map["icon"] = icon;
    map["activeIcon"] = activeIcon;
    map["pageName"] = pageName;
    return map;
  }
}
