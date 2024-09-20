import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/text_const.dart';

class AmbulanceReview extends StatefulWidget {
  const AmbulanceReview({super.key});

  @override
  State<AmbulanceReview> createState() => _AmbulanceReviewState();
}

class _AmbulanceReviewState extends State<AmbulanceReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: AppColor.whiteColor,
            border:
                Border(top: BorderSide(color: AppColor.greyColor, width: 0.5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: screenWidth,
                color: AppColor.whiteColor,
                child: Image.asset(
                  Assets.imageAmbuTextBg,
                  scale: 4,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  int.parse((screenWidth / 8).toStringAsFixed(0)),
                  (i) => TextConst(
                    title: '-',
                    fontSize: AppConstant.fontSizeZero,
                    color: AppColor.textColor.withOpacity(0.3),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AppConstant.spaceHeight5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextConst(
                        title: 'Distance: ',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      TextConst(
                        title: '250 Km',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.blackColor,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, RoutesName.ambulanceReview);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: screenHeight * 0.045,
                      width: screenWidth * 0.4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.buttonBgColor,
                      ),
                      child: TextConst(
                        title: 'Confirm booking',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.2,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextConst(
                    title: 'Ambulance',
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  TextConst(
                    title: 'Book your ride with HealthCRAD',
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: Image.asset(
              Assets.iconsPSecureIcons,
              scale: 5,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppConstant.spaceHeight10,
            Container(
              color: AppColor.whiteColor,
              width: screenWidth,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1, color: AppColor.blackColor)),
                          ),
                          Container(
                            height: 30,
                            width: 2,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      Assets.imageLineBg,
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          Image.asset(
                            Assets.iconsLocatinIcon,
                            height: 20,
                            width: 20,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                      child: Column(
                        children: [
                          TextFieldConst(
                            fillColor: AppColor.whiteColor,
                            filled: true,
                            onTap: () {},
                            enabled: false,
                            width: screenWidth * 0.7,
                            keyboardType: TextInputType.text,
                            hint: "Line bazar, Purnea, Bihar",
                            fontSize: AppConstant.fontSizeTwo,
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColor.textColor.withOpacity(0.2)),
                          ),
                          AppConstant.spaceHeight10,
                          TextFieldConst(
                            fillColor: AppColor.whiteColor,
                            filled: true,
                            onTap: () {},
                            enabled: false,
                            width: screenWidth * 0.7,
                            keyboardType: TextInputType.text,
                            hint: "PMCH, Patna, Bihar",
                            fontSize: AppConstant.fontSizeTwo,
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColor.textColor.withOpacity(0.2)),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      Assets.iconsAmbuArrowDown,
                      height: 25,
                      width: 25,
                    )
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: CustomRichText(textSpans: [
                  CustomTextSpan(
                      text: "Ambulance Type : ",
                      textColor: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: AppConstant.fontSizeTwo),
                  CustomTextSpan(
                      text: "Basic Life Support",
                      textColor: AppColor.textColor,
                      fontSize: AppConstant.fontSizeTwo),
                ]),
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: CustomRichText(textSpans: [
                  CustomTextSpan(
                      text: "Total Distance : ",
                      textColor: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: AppConstant.fontSizeTwo),
                  CustomTextSpan(
                      text: "250 Km",
                      textColor: AppColor.textColor,
                      fontSize: AppConstant.fontSizeTwo)
                ]),
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              color: AppColor.whiteColor,
              width: screenWidth,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextConst(
                      title: 'Patient details :',
                      fontSize: AppConstant.fontSizeTwo,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    AppConstant.spaceHeight15,
                    TextFieldConst(
                      keyboardType: TextInputType.text,
                      maxLength: 20,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 12,bottom: 12),
                        child: Image.asset(
                          Assets.iconsName,
                          height: 25,
                          width: 25,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      hint: "Ramesh Kumar",
                      fontSize: AppConstant.fontSizeTwo,
                      borderSide: BorderSide(
                          width: 1, color: AppColor.textColor.withOpacity(0.2)),
                    ),
                    AppConstant.spaceHeight10,
                    TextFieldConst(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 12,bottom: 12),
                        child: Image.asset(
                          Assets.iconsGreenCallIcon,
                          height: 25,
                          width: 25,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      hint: "945967006",
                      fontSize: AppConstant.fontSizeTwo,
                      borderSide: BorderSide(
                          width: 1, color: AppColor.textColor.withOpacity(0.2)),
                    ),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              color: AppColor.whiteColor,
              width: screenWidth,
              height: screenHeight / 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextConst(
                    fontWeight: FontWeight.w600,
                    title: 'Emergency Ambulance Care with',
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.textColor,
                  ),
                  AppConstant.spaceHeight5,
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "Health",
                        textColor: AppColor.buttonBgColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppConstant.fontSizeHeading / 1.5),
                    CustomTextSpan(
                        text: "CRAD",
                        textColor: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppConstant.fontSizeHeading / 1.5)
                  ]),
                ],
              ),
            ),
            AppConstant.spaceHeight10,
          ],
        ),
      ),
    );
  }
}
