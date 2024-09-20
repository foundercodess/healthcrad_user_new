import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/drop_down.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/view/more/widget/common_app_bar_more.dart';

import '../../res/custom_rich_text.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}
bool isTextFieldEnabled = false;
class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  ButtonConst(
        onTap: () {
          setState(() {
            isTextFieldEnabled = !isTextFieldEnabled; // Toggle the state
          });

        },
        color: AppColor.primaryColor,
        label: isTextFieldEnabled ? "Update":'Edit Profile',
        textColor: AppColor.whiteColor,
        fontSize: AppConstant.fontSizeThree,
      ),
      backgroundColor: AppColor.whiteColor,
      appBar: const CommonAppBarMore(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height:screenWidth/4,
                  width: screenWidth/4,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(Assets.imageDoctorBg),
                          fit: BoxFit.cover)),
                ),
              ),
              AppConstant.spaceHeight25,
              TextConst(
                title: 'Name *',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                enabled: isTextFieldEnabled,
                fillColor: AppColor.containerFillColor,
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
                hint: "Enter your name",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                BorderSide(width: isTextFieldEnabled ?1:0, color: isTextFieldEnabled ?AppColor.rBorderSideColor:Colors.transparent),
              ),
              AppConstant.spaceHeight15,
              TextConst(
                title: 'Phone Number *',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                enabled: isTextFieldEnabled,
                fillColor: AppColor.containerFillColor,
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
                hint: "Enter mobile number",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                BorderSide(width: isTextFieldEnabled ?1:0, color: isTextFieldEnabled ?AppColor.rBorderSideColor:Colors.transparent),
              ),
              AppConstant.spaceHeight15,
              CustomRichText(textSpans: [
                CustomTextSpan(
                    text: "Email ",
                    fontWeight: FontWeight.w600,
                    textColor: AppColor.blackColor,
                    fontSize: AppConstant.fontSizeOne),
                CustomTextSpan(
                    text: "(Optional)",
                    textColor: AppColor.textColor,
                    fontSize: AppConstant.fontSizeOne)
              ]),
              AppConstant.spaceHeight5,
              TextFieldConst(
                enabled: isTextFieldEnabled,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.text,
                maxLength: 20,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  child: Image.asset(
                    Assets.iconsEmailIcon,
                    height: 25,
                    width: 25,
                    color: AppColor.primaryColor,
                  ),
                ),
                hint: "Enter your Email",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                BorderSide(width: isTextFieldEnabled ?1:0, color: isTextFieldEnabled ?AppColor.rBorderSideColor:Colors.transparent),
              ),
              AppConstant.spaceHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConst(
                        title: 'Gender *',
                        fontSize: AppConstant.fontSizeOne,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      AppConstant.spaceHeight5,
                      isTextFieldEnabled? const CustomDropdown(
                      ):Container(
                        width: screenWidth/2.5,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                         // border:Border.all(width: 0.5, color: AppColor.rBorderSideColor),
                         color: AppColor.containerFillColor,
                       ),
                        height: 48,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12,bottom: 12),
                              child: Image.asset(
                                Assets.iconsSelectIcon,
                                height: 25,
                                width: 25,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            AppConstant.spaceWidth10,
                            TextConst(
                              title: "Male",
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "Data of Birth ",
                            textColor: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppConstant.fontSizeOne),
                        CustomTextSpan(
                            text: "(Optional)",
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeOne)
                      ]),
                      AppConstant.spaceHeight5,
                      TextFieldConst(
                        onTap: () {
                        },
                        enabled: false,
                        width: screenWidth / 2.3,
                        fillColor: AppColor.containerFillColor,
                        keyboardType: TextInputType.text,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 12,bottom: 12),
                          child: Image.asset(
                            Assets.iconsCalenderIcon,
                            height: 25,
                            width: 25,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        hint: "28/02/2000",
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                    ],
                  ),
                ],
              ),
              AppConstant.spaceHeight15,
              SizedBox(
                width: screenWidth,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    int.parse((screenWidth / 8).toStringAsFixed(0)),
                        (i) => TextConst(
                      title: '-',
                      fontSize: AppConstant.fontSizeZero,
                      color: AppColor.textColor.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              AppConstant.spaceHeight15,
              TextConst(
                title: 'Emergency contact Number 1',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                enabled: isTextFieldEnabled,
                fillColor: AppColor.containerFillColor,
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
                hint: "+919122471133",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                BorderSide(width: isTextFieldEnabled ?1:0, color: isTextFieldEnabled ?AppColor.rBorderSideColor:Colors.transparent),
              ),
              AppConstant.spaceHeight10,
              TextConst(
                title: 'Emergency contact Number 2',
                fontSize: AppConstant.fontSizeOne,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                enabled: isTextFieldEnabled,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.number,
                maxLength: 10,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  child: Image.asset(
                    Assets.iconsGreenCallIcon,
                    height: 25,
                    width: 25,                  color: AppColor.primaryColor,
                  ),
                ),
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                hint: "+919122471133",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                BorderSide(width: isTextFieldEnabled ?1:0, color: isTextFieldEnabled ?AppColor.rBorderSideColor:Colors.transparent),
              ),
              AppConstant.spaceHeight10,
              TextConst(
                title: 'Emergency contact Number 3',
                fontWeight: FontWeight.w600,
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                enabled: isTextFieldEnabled,
                fillColor: AppColor.containerFillColor,
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
                hint: "+919122471133",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                BorderSide(width: isTextFieldEnabled ?1:0, color: isTextFieldEnabled ?AppColor.rBorderSideColor:Colors.transparent),
              ),
              AppConstant.spaceHeight20,

            ],
          ),
        ),
      ),
    );
  }
}
