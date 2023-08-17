
import 'package:flutter/material.dart';

AppColor appColor = AppColor();

class AppColor {
  static final AppColor _appColor = AppColor._i();

  factory AppColor() {
    return _appColor;
  }

  AppColor._i();

  final Color bgclr = Color(0xFFF7F8FA);
  final Color main = const Color(0xFF5297F4);
  final Color primaryColor = const Color(0xFF5297F4);
  final Color primaryDarkColor = const Color(0xFF5297F4);
  final Color primaryLightColor = const Color(0xFF5297F4);
  final Color primaryLight = const Color(0xFF5297F4);
  final Color accentColor = const Color(0xff39446F);
  final Color greyBg = const Color(0xffD8D8D8);

  final Color bg = const Color(0xffF5F6FB);
  final Color pageBg = const Color.fromARGB(255, 250, 250, 250);

  final Color yellow = const Color.fromARGB(255, 255, 231, 15);

  final Color bgColor = const Color(0xFFEAF1FF);

  final Color bgWhite = const Color(0xffFFFFFF);
  final Color txtTitle = const Color(0xff212121);
  final Color txtSubTitle = const Color(0xff969696);
  final Color fieldClr = Colors.black38;
  final Color fill = const Color(0xffF8F8F8);
  final Color bgGreenLight = const Color(0xffE5FCE3);

  final Color btn = const Color(0xff00B761);

  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color transparent = Colors.transparent;
}
