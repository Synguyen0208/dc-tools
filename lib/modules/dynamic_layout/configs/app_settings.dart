class AppSetting {
  late String mainColor;
  late String fontFamily;

  AppSetting({
    this.mainColor = '',
    this.fontFamily = 'Roboto',
  });

  AppSetting.fromJson(Map config) {
    mainColor = config['MainColor'] ?? '';
    fontFamily = config['FontFamily'] ?? 'Roboto';

    AppSetting copyWith({
      String? mainColor,
      String? fontFamily,
    }) {
      return AppSetting(
        mainColor: mainColor ?? this.mainColor,
        fontFamily: fontFamily ?? this.fontFamily,
      );
    }
  }
}
