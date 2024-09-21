// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:health_crad_user/generated/assets.dart';
// import 'package:health_crad_user/res/app_color.dart';
// import 'package:health_crad_user/res/app_constant.dart';
// import 'package:health_crad_user/res/text_const.dart';
// import 'package:health_crad_user/utils/routes/routes_name.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   SplashScreenState createState() => SplashScreenState();
// }
//
// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () {
//       Navigator.pushNamed(context, RoutesName.login);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//          height: MediaQuery.of(context).size.height,
//           width:MediaQuery.of(context).size.width/1.5,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(Assets.imageAppLogo),
//               fit: BoxFit.contain,
//             ),
//           ),
//           alignment: Alignment.bottomCenter,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextConst(title: "Your health's true",fontSize: AppConstant.fontSizeLarge,color: AppColor.blueColor,fontWeight: FontWeight.bold,),
//               TextConst(title: "Companion",fontSize: AppConstant.fontSizeLarge,color: AppColor.primaryColor,fontWeight: FontWeight.bold,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
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

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> _imagePaths = [
    Assets.pngDoctorBgO,
    Assets.pngSilderBgSpecialOffer,
    Assets.pngSilderBgSpecialOffer,
    Assets.pngSilderBgSpecialOffer,
    Assets.pngSilderBgSpecialOffer,
    Assets.pngSilderBgSpecialOffer,
    Assets.pngSilderBgSpecialOffer,
    Assets.pngSilderBgSpecialOffer,

  ];
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          // Container(
          //   height: screenHeight * 0.6,
          //   width: screenWidth,
          //   color: Color(0xff0154a2),
          //   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       AppConstant.spaceHeight25,
          //       Container(
          //         height: screenHeight * 0.06,
          //         width: screenWidth * 0.5,
          //         padding: const EdgeInsets.symmetric(horizontal: 15),
          //         decoration: BoxDecoration(
          //           color: AppColor.whiteColor,
          //           borderRadius: const BorderRadius.only(
          //               topRight: Radius.circular(50),
          //               bottomRight: Radius.circular(50)),
          //         ),
          //         alignment: Alignment.centerLeft,
          //         child: Image.asset(
          //           Assets.imageAppLogo,
          //           width: screenWidth / 2.5,
          //         ),
          //       ),
          //       AppConstant.spaceHeight50,
          //       AppConstant.spaceHeight10,
          //       Container(
          //         margin: EdgeInsets.only(left: 20),
          //         height: screenHeight*0.2,
          //         width: screenWidth*0.43,
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage(Assets.imageDoctorBg),fit: BoxFit.fill,
          //           )
          //         ),
          //         // color: Colors.red,
          //       ),
          //       AppConstant.spaceHeight20,
          //       AppConstant.spaceHeight10,
          //       Container(
          //         padding: EdgeInsets.only(left: 25),
          //         width: screenWidth*0.8,
          //         // color: Colors.red,
          //         child:  TextConst(
          //           textAlign: TextAlign.start,
          //           title: 'Book doctors appointment in just 30 sec.',
          //           fontSize: AppConstant.fontSizeHeading /1.6,
          //           color: AppColor.whiteColor,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       AppConstant.spaceHeight30,
          //       Container(
          //         padding: EdgeInsets.only(left: 20),
          //         height: 50,
          //         width: screenWidth * 0.5,
          //         child: ListView.builder(
          //           itemCount: 4,
          //           scrollDirection: Axis.horizontal,
          //           itemBuilder: (context, index) {
          //             return Container(
          //               margin: EdgeInsets.symmetric(horizontal: 2),
          //               height: 7,
          //               width: 7,
          //               decoration: BoxDecoration(
          //                 color: index == 0 ?AppColor.primaryColor:AppColor.whiteColor,
          //
          //                 shape: BoxShape.circle,
          //               ),
          //             );
          //           },
          //         ),
          //       )
          //
          //
          //     ],
          //   ),
          // ),
          Container(
            width: screenWidth,
            height: screenHeight*0.6,
            color: Color(0xff0154a2),
            child:Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                    MainPageSlider(),
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
              height: screenHeight*0.06,
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff0154a2),
              fontSize: AppConstant.fontSizeThree,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextConst(
                    textAlign: TextAlign.start,
                    title: "Let's Get Started",
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Image.asset(Assets.pngMainScreenArrow,    height: 25,
                    width: 25,)
                ],
              ),
            ),
          ),
          Spacer(),
          TextConst(
            textAlign: TextAlign.start,
            title: "Follow Us",
            fontSize: AppConstant.fontSizeTwo,
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
          ),
          AppConstant.spaceHeight10,
          Container(
            width: screenWidth*0.6,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialMedia(context,Assets.pngLinkdin, screenHeight*0.04,screenWidth*0.085),
                SocialMedia(context,Assets.pngWhatsapp,screenHeight*0.04,screenWidth*0.085),
                SocialMedia(context,Assets.pngInsta,screenHeight*0.04,screenWidth*0.085),
                SocialMedia(context,Assets.pngFacebook,screenHeight*0.04,screenWidth*0.085),
                SocialMedia(context,Assets.pngYoutube,screenHeight*0.055,screenWidth*0.089),
              ],
            ),
          ),
          AppConstant.spaceHeight25,
        ],
      ),
    );
  }
  Widget SocialMedia( context,img,double ?height,double width ) {
    return Container(
      height:height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),fit: BoxFit.fill
        )
      ),

    );
  }
}

