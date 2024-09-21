import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/Auth_res/auth_bg.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

class PathLabPage extends StatefulWidget {
  const PathLabPage({super.key});

  @override
  State<PathLabPage> createState() => _PathLabPageState();
}

class _PathLabPageState extends State<PathLabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
    appBar:  AppBar(
        backgroundColor: AppColor.primaryColor,
        leadingWidth: screenWidth,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  Assets.iconsArrowBack,
                  color: AppColor.whiteColor,
                  scale: 3,
                ),
              ),
              AppConstant.spaceWidth10,
              TextConst(
                title: 'Pathlab',
                fontSize: AppConstant.fontSizeThree,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),

      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 35, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReportWidget(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.pathReport);
              },
              title: 'My Report',
              img: Assets.imagePathReportBg,
              fontWeight: FontWeight.w600,
              subTitle: 'Empathy in practice, excellence in care.',
            ),
            AppConstant.spaceHeight30,
            ReportWidget(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.requestReport);
              },
              title: 'Request a Report',
              img: Assets.imageRequestReportBg,
              fontWeight: FontWeight.w600,
              subTitle:
                  'Commit to health: every day, every step, every choice makes a difference.',
            ),
            AppConstant.spaceHeight30,
            Container(
              width: screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: screenHeight * 0.04,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imagePathLabTrustBg),
                      fit: BoxFit.fill)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Icon(
                    Icons.check_circle,
                    color: AppColor.blueColor,
                    size: 18.0,
                  ),
                  AppConstant.spaceWidth5,
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "HealthCRAD Assured",
                        textColor: AppColor.blueColor,
                        fontSize: AppConstant.fontSizeOne),
                    CustomTextSpan(
                        text: " - Your trust, Our commitment.",
                        textColor: AppColor.blackColor.withOpacity(0.8),
                        fontSize: AppConstant.fontSizeOne)
                  ]),
                ],
              ),
            ),
            const Spacer(),
            AuthImage(
              height: screenHeight * 0.35,
              width: screenWidth * 0.85,
              img: Assets.imagePathLabBgScreen,
            ),
          ],
        ),
      ),
    );
  }
}

class ReportWidget extends StatelessWidget {
  const ReportWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.img,
    this.onTap, this.fontWeight,
  });
  final String title;
  final String subTitle;
  final String img;
  final VoidCallback? onTap;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: screenWidth,
            height: screenHeight * .12,
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(offset: const Offset(0, 1), color: Colors.grey.shade100, spreadRadius: 1, blurRadius: 3)
                ],
              borderRadius: BorderRadius.circular(10),
              color: AppColor.whiteColor,
            ),
            child: SizedBox(
              width: screenWidth * 0.55,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextConst(
                    fontWeight: fontWeight,
                    title: title,
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.blackColor,
                  ),
                  AppConstant.spaceHeight10,
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: TextConst(
                      textAlign: TextAlign.start,
                      title: subTitle,
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: screenWidth / 4,
            height: screenHeight * .14,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.fill)),
          ),
        ),
      ],
    );
  }
}
