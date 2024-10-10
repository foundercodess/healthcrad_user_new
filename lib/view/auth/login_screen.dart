import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom
    ]);


    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: screenWidth,
              width: screenWidth,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imageLoginBg),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: screenHeight * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConst(
                    title: 'Let’s get started! Enter your mobile number',
                    fontSize: AppConstant.fontSizeOne,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  TextFieldConst(
                    fillColor: AppColor.whiteColor,
                    keyboardType: TextInputType.number,
                    controller: mobileCon,
                    maxLength: 10,
                    prefixIcon: Container(
                      width:60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal:5),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextConst(
                            title: '+91',
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.blackColor,
                          ),
                          const VerticalDivider()
                        ],
                      ),
                    ),
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    hint: "Mobile number",
                    fontSize: AppConstant.fontSizeTwo,
                    borderSide: BorderSide(
                        width: 1, color: AppColor.lBorderSideColor),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  authViewModel.isLoading?Utils.loading():
                  ButtonConst(
                    onTap: () {
                      if(mobileCon.text.length ==10 ){
                        authViewModel.loginApi(mobileCon.text, context);
                      }else {
                        Utils.show(' Please Enter 10 digit Number', context);
                      }
                    },
                    loading: authViewModel.isLoading,
                    color: AppColor.primaryColor,
                    label: 'Continue',
                    textColor: AppColor.whiteColor,
                    fontSize: AppConstant.fontSizeThree,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "By continuing, you agree to our ",
                        textColor: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeOne),
                    CustomTextSpan(
                        text: 'Terms & Conditions',
                        textColor: AppColor.primaryColor,
                        fontSize: AppConstant.fontSizeOne)
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
