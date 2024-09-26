import 'dart:async';
import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';

import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view_model/service/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.width/1.5,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imageAppLogo),
                fit: BoxFit.contain,
              ),
            ),
            alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextConst(title: "Your health's true",fontSize: AppConstant.fontSizeLarge,color: AppColor.blueColor,fontWeight: FontWeight.bold,),
              TextConst(title: "Companion",fontSize: AppConstant.fontSizeLarge,color: AppColor.primaryColor,fontWeight: FontWeight.bold,),
            ],
          ),
        ),
      ),
    );
  }
}
