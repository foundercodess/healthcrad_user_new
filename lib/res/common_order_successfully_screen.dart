import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

import 'text_const.dart';

class CommonOrderScreen extends StatefulWidget {
  const CommonOrderScreen({super.key,});

  @override
  State<CommonOrderScreen> createState() => _CommonOrderScreenState();
}

class _CommonOrderScreenState extends State<CommonOrderScreen> {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.3,
              width: screenWidth * 0.74,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imageOrderPlacedBg),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: screenHeight * 0.2,
              width: screenWidth * 0.74,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextConst(
                    title:
                       args["name"],
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.blackColor,
                  ),
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "Go to ",
                        textColor: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeTwo),
                    CustomTextSpan(
                        text: "My Order ",
                        textColor: AppColor.primaryColor,
                        fontSize: AppConstant.fontSizeTwo),
                    CustomTextSpan(
                        text: "section",
                        textColor: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeTwo)
                  ]),
                  ButtonConst(
                    height: screenHeight * 0.04,
                    width: screenWidth * 0.4,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.bottomNavBar);
                    },
                    color: AppColor.blueColor,
                    label: 'Go to dashboard',
                    textColor: AppColor.whiteColor,
                    fontSize: AppConstant.fontSizeTwo,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
