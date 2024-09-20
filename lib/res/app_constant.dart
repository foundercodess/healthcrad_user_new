import 'package:flutter/material.dart';
import 'package:health_crad_user/main.dart';

class AppConstant {
  static const String appName = "Health Crad User";

  static const String rupeeSymbol = "₹";

  static double get fontSizeZero =>
      screenWidth < 500 ? screenWidth / 40 : screenWidth / 50;
  static double get fontSizeOne =>
      screenWidth < 500 ? screenWidth / 32 : screenWidth / 45;
  static double get fontSizeTwo =>
      screenWidth < 500 ? screenWidth / 28 : screenWidth / 38;
  static double get fontSizeThree =>
      screenWidth < 500 ? screenWidth / 25 : screenWidth / 33;
  static double get fontSizeLarge =>
      screenWidth < 500 ? screenWidth / 18 : screenWidth / 28;
  static double get fontSizeHeading =>
      screenWidth < 500 ? screenWidth / 13 : 23;


  static const spaceWidth5 = SizedBox(width: 5);
  static const spaceWidth10 = SizedBox(width: 10);
  static const spaceWidth15 = SizedBox(width: 15);
  static const spaceWidth20 = SizedBox(width: 20);
  static const spaceWidth25 = SizedBox(width: 25);

  static const spaceHeight5 = SizedBox(height: 5);
  static const spaceHeight10 = SizedBox(height: 10);
  static const spaceHeight15 = SizedBox(height: 15);
  static const spaceHeight20 = SizedBox(height: 20);
  static const spaceHeight25 = SizedBox(height: 25);
  static const spaceHeight30 = SizedBox(height: 30);
  static const spaceHeight50 = SizedBox(height: 50);
  static const spaceHeight180 = SizedBox(height: 180);

static const iconSize48 = 48.0;


}
