import 'package:store/models/entities/sort_bar.dart';
import 'package:store/modules/dynamic_layout/configs/app_settings.dart';

class AppConfig {
  late AppSetting settings;
  List<BottomTabConfig> bottomTab = [];
  late SortBarConfig sortBarConfig;
  late List<String> sliders = [];
  late List<ProductBannerConfig> productBannerConfigs = [];
  dynamic jsonData;

  AppConfig({
    required this.settings,
    required this.bottomTab,
    required this.sortBarConfig,
  });

  AppConfig.fromJson(dynamic json) {
    List<dynamic> slides = json["slides"];
    if (json['setting'] != null) {
      settings = AppSetting.fromJson(json['setting']);
    }
    bottomTab = [];
    if (json['bottomTab'] != null) {
      json['bottomTab'].forEach((v) {
        bottomTab.add(BottomTabConfig.fromJson(v));
      });
    }
    if (json["sortBar"] != null) {
      sortBarConfig = SortBarConfig.fromJson(json['sortBar']);
    }
    if (json["slides"] != null) {
      sliders = slides.map((slide) => slide.toString()).toList();
    }
    if (json["homeProductBanner"] != null) {
      List<dynamic> banners = json["homeProductBanner"];
      productBannerConfigs = banners
          .map((banner) => ProductBannerConfig.fromJson(banner))
          .toList();
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

class SortBarConfig {
  late List<SortBar> sortBars;

  SortBarConfig({required this.sortBars});

  SortBarConfig.fromJson(dynamic json) {
    List<SortBar> _sortBars = [];
    if (json["sortBars"] != null) {
      dynamic data = json["sortBars"];
      for (var item in data) {
        _sortBars.add(SortBar.fromJson(item));
      }
    }
    sortBars = _sortBars;
  }
}

class ProductBannerConfig {
  late String keySearch;
  late String title;

  ProductBannerConfig({required this.keySearch, required this.title});

  ProductBannerConfig.fromJson(dynamic json) {
    keySearch = json["keySearch"];
    title = json["title"];
  }
}
