import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/res/Auth_res/auth_bg.dart';
import 'package:health_crad_user/res/Auth_res/auth_screen_bg.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';

import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/auth_view_model.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../res/Auth_res/otp_const.dart';

class LoginOtpScreen extends StatefulWidget {
  const LoginOtpScreen({super.key});

  @override
  State<LoginOtpScreen> createState() => _LoginOtpScreenState();
}

class _LoginOtpScreenState extends State<LoginOtpScreen> {
  final TextEditingController otpCon = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

      if (arguments != null) {
        final authViewModel =
            Provider.of<AuthViewModel>(context, listen: false);
        authViewModel.sendOtpApi(arguments['phone'], context);
      } else {
        if (kDebugMode) {
          print('No arguments found');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    Map arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return AuthScreenBg(
        column: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstant.spaceHeight50,
            TextConst(
              title: 'Otp'.toUpperCase(),
              fontSize: AppConstant.fontSizeTwo,
              color: AppColor.otpColor,
              fontWeight: FontWeight.w600,
            ),
            AppConstant.spaceHeight10,
            otpField(otpCon),
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
                if (otpCon.length == 5 || otpCon.text.isNotEmpty) {
                  authViewModel.verifyOtpApi(
                      arguments['phone'], otpCon.text, context);
                } else {
                  Utils.show("Please enter Valid Otp", context);
                }
              },
              color: AppColor.primaryColor,
              label: 'Verify Otp',
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
