import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

import '../../res/text_const.dart';

class CategoryTapListDoctor extends StatefulWidget {
  const CategoryTapListDoctor({super.key});

  @override
  State<CategoryTapListDoctor> createState() => _CategoryTapListDoctorState();
}

class _CategoryTapListDoctorState extends State<CategoryTapListDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
          appBar: AppBar(
    toolbarHeight: kToolbarHeight*1.3,
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
          AppConstant.spaceWidth15,
          TextFieldConst(
            width: screenWidth/1.3,
            height: 45,
            filled: true,
            fillColor: AppColor.whiteColor,
            keyboardType: TextInputType.text,
            maxLength: 35,
            maxLines: 1,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 12),
              child: SvgPicture.asset(
                  Assets.svgSearchIcons,
                  height:10,
                  width: 10,


              ),
            ),
            hint: "Find doctors...",
            fontSize: AppConstant.fontSizeTwo,
            sufixIcon: Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 12),
              child: SvgPicture.asset(
                Assets.svgMicIcons,

                height: 10,
                width: 10,
              ),
            ),
          )
        ],
      ),
    ),
    actions: [
      AppConstant.spaceWidth5,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Image.asset(
                Assets.iconsFiltterIcon,
                scale: 3,
              ),
            ],
          ),
        ),
      ),
    ],
          ),
          body: ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: 6,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.only(top: index == 0 ? 10 : 0, bottom: 10),
        width: screenWidth,
        color: AppColor.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: screenHeight * 0.11,
                    width: screenWidth * 0.25,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(Assets.imageDoctorBg),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: screenWidth /1.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextConst(
                              title: 'Dr. Abhishek Kumar',
                              maxLines: 1,
                              fontSize: AppConstant.fontSizeThree,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: Colors
                                  .grey,
                              size:
                                  20.0,
                            )
                          ],
                        ),
                        AppConstant.spaceHeight5,
                        TextConst(
                          textAlign: TextAlign.start,
                          title: 'General Physician',
                          maxLines: 1,
                          fontSize: AppConstant.fontSizeOne,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                        TextConst(
                          textAlign: TextAlign.start,
                          title: 'MBBS, MD',
                          maxLines: 1,
                          fontSize: AppConstant.fontSizeOne,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                        AppConstant.spaceHeight5,
                        TextConst(
                          title: '25 years experience',
                          maxLines: 1,
                          fontSize: AppConstant.fontSizeOne,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                        AppConstant.spaceHeight10,
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          height: screenHeight * 0.036,
                          width: screenWidth * 0.37,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      Assets.imageVerifyDoctorBg),
                                  fit: BoxFit.fill)),
                          child: TextConst(
                            title: 'HealthCRAD Verified',
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeOne,
                            textAlign: TextAlign.start,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppConstant.spaceHeight15,
              SizedBox(
                width: screenWidth,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(int.parse((screenWidth/5).toStringAsFixed(0)), (i)=>TextConst(
                    title:
                    '-',
                    fontSize: 5,
                    color: AppColor.textColor.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
              AppConstant.spaceHeight10,
              Row(
                children: [
                  Image.asset(
                    Assets.iconsLocatinIcon,
                    color: AppColor.redColor,
                    scale: 2.5,
                  ),
                  AppConstant.spaceWidth5,
                  TextConst(
                    title: 'PMCH, Patna, Bihar',
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.textColor.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              AppConstant.spaceHeight10,
              CustomRichText(textSpans: [
                CustomTextSpan(
                    text: "• ₹ 500 ",
                    fontWeight: FontWeight.bold,
                    textColor: AppColor.blackColor,
                    fontSize: AppConstant.fontSizeTwo),
                CustomTextSpan(
                    text: "Consultation Fees",
                    textColor: AppColor.blackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: AppConstant.fontSizeTwo)
              ]),
              AppConstant.spaceHeight15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonConst(
                    width: screenWidth * 0.42,
                    height: screenHeight * 0.045,
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.doctorProfile);
                    },
                    border:
                        Border.all(width: 1, color: AppColor.primaryColor),
                    label: 'View Profile',
                    textColor: AppColor.primaryColor,
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.whiteColor,
                  ),
                  index == 0
                      ? ButtonConst(
                          width: screenWidth * 0.42,
                          height: screenHeight * 0.045,
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.slotPage);
                          },
                          color: AppColor.primaryColor,
                          // border: Border.all(width: 1,color: AppColor.primaryColor),
                          label: 'Book Appointment',
                          textColor: AppColor.whiteColor,
                          fontSize: AppConstant.fontSizeTwo,
                        )
                      : ButtonConst(
                          width: screenWidth * 0.42,
                          height: screenHeight * 0.045,
                          onTap: () {
                            // Navigator.pushNamed(context, RoutesName.verifyOtpScreen);
                          },
                          color: AppColor.greyColor.withOpacity(0.3),
                          // border: Border.all(width: 1,color: AppColor.primaryColor),
                          label: 'Book Appointment',
                          textColor: AppColor.textColor,
                          fontSize: AppConstant.fontSizeTwo,
                        ),
                ],
              ),
            ],
          ),
        ),
      );
    },
          ),
        );
  }
}
