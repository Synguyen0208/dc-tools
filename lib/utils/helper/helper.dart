import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

String getAssetName(String fileName) {
  return "assets/images/$fileName";
}

String getAssetIcon(String iconName) {
  return "assets/icons/$iconName";
}

TextTheme getTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

String formatCurrency(currency) {
  return NumberFormat.simpleCurrency(locale: "vi_VN").format(currency);
}
