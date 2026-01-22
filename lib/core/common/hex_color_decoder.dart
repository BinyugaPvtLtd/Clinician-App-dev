import 'dart:ui';

import '../constant/app_colors.dart';

Color hexToColor(String? hex) {
  if (hex == null || hex.trim().isEmpty) return AppColors.chatRedColor;
  String value = hex.trim();
  if (value.startsWith("#")) {
    value = value.replaceFirst("#", "");
    return Color(int.parse("0xFF$value"));
  }
  if (value.startsWith("0x") || value.startsWith("0X")) {
    return Color(int.parse(value));
  }
  if (value.length == 6) {
    return Color(int.parse("0xFF$value"));
  }
  return AppColors.chatRedColor;
}