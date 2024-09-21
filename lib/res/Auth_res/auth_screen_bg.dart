import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../main.dart';
import '../app_color.dart';
import '../app_constant.dart';
import '../text_const.dart';

class AuthScreenBg extends StatelessWidget {
  final Column column;
  final String title;
  final String subTitle;
  const AuthScreenBg({super.key, required this.column, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        bottom: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight/1.8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  Assets.iconsArrowBack,
                  height: 20,
                  width: 20,
                ),
              ),
              AppConstant.spaceWidth15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConst(
                    title:title,
                    fontWeight: FontWeight.w600,
                    fontSize: AppConstant.fontSizeLarge,
                    color: AppColor.whiteColor,
                  ),
                  TextConst(
                    title: subTitle,
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.whiteColor,
                  ),
                ],
              ),
            ],
          ),
        ),),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 2),
          child: column
        ),
      ),
    );;
  }
}
