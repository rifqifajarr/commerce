import 'package:flutter/material.dart';

extension CustomColors on ThemeData {
  Color get colorRedPrimary => brightness == Brightness.light
      ? const Color(0xFFD32F2F)
      : const Color(0xFFB71C1C);

  Color get shadowColor => Colors.black.withValues(alpha: .05);
  Color get background =>
      brightness == Brightness.light ? Color(0xffF5F6FA) : Color(0xff202020);
}
