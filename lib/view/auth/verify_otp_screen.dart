import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/Auth_res/auth_bg.dart';
import 'package:health_crad_user/res/Auth_res/auth_screen_bg.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';

import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

import '../../res/Auth_res/otp_const.dart';

class LoginOtpScreen extends StatefulWidget {
  const LoginOtpScreen({super.key});

  @override
  State<LoginOtpScreen> createState() => _LoginOtpScreenState();
}

class _LoginOtpScreenState extends State<LoginOtpScreen> {
  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AuthScreenBg(
        column: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstant.spaceHeight50,
            TextConst(
              title: 'Otp'.toUpperCase(),
              fontSize: AppConstant.fontSizeTwo,
              color: AppColor.otpColor,
            ),
            AppConstant.spaceHeight10,
            otpField(otpController),
            AppConstant.spaceHeight15,
            TextConst(
              title: 'Resend OTP',
              fontSize: AppConstant.fontSizeTwo,
              color: AppColor.primaryColor,
            ),
            AppConstant.spaceHeight25,
            AppConstant.spaceHeight15,
            ButtonConst(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.bottomNavBar);
              },
              color: AppColor.primaryColor,
              label: 'Login',
              fontWeight: FontWeight.w600,
              textColor: AppColor.whiteColor,
              fontSize: AppConstant.fontSizeThree,
            ),
            const Spacer(),
            const AuthImage()
          ],
        ),
        title: "Fill the OTP",
        subTitle: "Verify your account using OTP");
  }
}
