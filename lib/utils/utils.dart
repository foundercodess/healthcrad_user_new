import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'dart:async';

import '../main.dart';

class Utils {
  static OverlayEntry? _overlayEntry;
  static bool _isShowing = false;

  static void show(String message, BuildContext context, {Color? color}) {
    if (_isShowing) {
      _overlayEntry?.remove();
    }

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: color ?? Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    _isShowing = true;

    _startTimer();
  }

  static void _startTimer() {
    Timer(const Duration(seconds: 2), () {
      if (_overlayEntry != null) {
        _overlayEntry!.remove();
        _isShowing = false;
      }
    });
  }

  static OverlayEntry? _overlayImgEntry;
  static bool _isShowingImg = false;

  static void showImage(String imagePath, BuildContext context,
      {int duration = 2}) {
    if (_isShowingImg) {
      _overlayImgEntry?.remove();
    }

    _overlayImgEntry = OverlayEntry(
      builder: (BuildContext context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: screenWidth,
            height: screenWidth * 0.05,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.fill)),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayImgEntry!);
    _isShowingImg = true;

    _startImgTimer(duration);
  }

  static void _startImgTimer(int duration) {
    Timer(Duration(seconds: duration), () {
      if (_overlayImgEntry != null) {
        _overlayImgEntry!.remove();
        _isShowingImg = false;
      }
    });
  }

  static Widget loading({Color? loadingColor}) {
    return Center(
        child: CircularProgressIndicator(
      color: loadingColor ?? AppColor.primaryColor,
    ));
  }

  static Widget noDataFound({String? title}){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: screenWidth/2,
            width: screenWidth/2,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Assets.pngMainBg))),
          ),
          // AppConstant.spaceHeight5,
          TextConst(title:title?? "Opps! No data found",fontSize: AppConstant.fontSizeTwo,),
        ],
      ),
    );
  }
}
