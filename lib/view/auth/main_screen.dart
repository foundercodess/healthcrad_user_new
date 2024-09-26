
import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/main_page_slider.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

double screenHeight = 0;
double screenWidth = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.6,
            color: const Color(0xff0154a2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstant.spaceHeight25,
                Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.5,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    Assets.pngAppLogoClint,
                    width: screenWidth / 2.5,
                  ),
                ),
                AppConstant.spaceHeight50,
                AppConstant.spaceHeight10,
                const MainPageSlider(),
              ],
            ),
          ),
          AppConstant.spaceHeight50,
          TextConst(
            textAlign: TextAlign.start,
            title: "Your health's true Companion ",
            fontSize: AppConstant.fontSizeTwo,
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
          ),
          AppConstant.spaceHeight30,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ButtonConst(
              height: screenHeight * 0.06,
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xff0154a2),
              fontSize: AppConstant.fontSizeThree,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextConst(
                    textAlign: TextAlign.start,
                    title: "Let's Get Started",
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Image.asset(
                    Assets.pngMainScreenArrow,
                    height: 25,
                    width: 25,
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          TextConst(
            textAlign: TextAlign.start,
            title: "Follow Us",
            fontSize: AppConstant.fontSizeTwo,
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
          ),
          AppConstant.spaceHeight10,
          SizedBox(
            width: screenWidth * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                socialMedia(context, Assets.pngLinkdin, screenHeight * 0.04,
                    screenWidth * 0.085),
                socialMedia(context, Assets.pngWhatsapp, screenHeight * 0.04,
                    screenWidth * 0.085),
                socialMedia(context, Assets.pngInsta, screenHeight * 0.04,
                    screenWidth * 0.085),
                socialMedia(context, Assets.pngFacebook, screenHeight * 0.04,
                    screenWidth * 0.085),
                socialMedia(context, Assets.pngYoutube, screenHeight * 0.055,
                    screenWidth * 0.089),
              ],
            ),
          ),
          AppConstant.spaceHeight25,
        ],
      ),
    );
  }

  Widget socialMedia(context, img, double? height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill)),
    );
  }
}
