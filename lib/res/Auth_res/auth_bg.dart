import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';

class AuthImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String? img;
  const AuthImage({
    super.key, this.width, this.height, this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? screenHeight * 0.3,
      width: width??screenWidth,
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(img??Assets.imageAuthBg), fit: BoxFit.fill)),
    );
  }
}