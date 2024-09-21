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
import 'package:health_crad_user/view_model/service/register_view_model.dart';
import 'package:provider/provider.dart';

import '../../res/custom_rich_text.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

bool _isTextFieldEnabled = false;

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {

    return Consumer<AuthViewModel>(builder: (context, rvm, child) {
      return Scaffold(
        bottomNavigationBar: ButtonConst(
          onTap: () {
            setState(() {
              _isTextFieldEnabled = !_isTextFieldEnabled; // Toggle the state
            });
          },
          color: AppColor.primaryColor,
          label: _isTextFieldEnabled ? 'Edit Profile' : "Update",
          textColor: AppColor.whiteColor,
          fontSize: AppConstant.fontSizeThree,
        ),
        backgroundColor: AppColor.whiteColor,
        appBar: CommonAppBarMore(
          title: _isTextFieldEnabled ? "Edit Account" : "View Account",),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: screenWidth * 0.3,
                        width: screenWidth * 0.3,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(Assets.pngDoctorBgO),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        bottom:
                        -screenHeight * 0.01,
                        right: -screenWidth * 0.01,
                        child: _isTextFieldEnabled ? Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.029,
                          width: screenWidth * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                                width: 0.5, color: AppColor.primaryColor),
                            color: AppColor.whiteColor,
                          ),
                          child: TextConst(
                            title: 'Edit',
                            fontSize: AppConstant.fontSizeZero,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ) : Container(),
                      )
                    ],
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
                  enabled: _isTextFieldEnabled,
                  fillColor: AppColor.containerFillColor,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 13, bottom: 13),
                    child: Image.asset(
                      Assets.iconsName,
                      height: 15,
                      width: 15,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  hint: "Enter your name",
                  fontSize: AppConstant.fontSizeTwo,
                  borderSide: BorderSide(
                      width: _isTextFieldEnabled ? 1 : 0,
                      color: _isTextFieldEnabled
                          ? AppColor.rBorderSideColor
                          : Colors.transparent),
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
                  enabled: _isTextFieldEnabled,
                  fillColor: AppColor.containerFillColor,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 13, bottom: 13),
                    child: Image.asset(
                      Assets.iconsGreenCallIcon,
                      height: 15,
                      width: 15,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  hint: "Enter mobile number",
                  fontSize: AppConstant.fontSizeTwo,
                  borderSide: BorderSide(
                      width: _isTextFieldEnabled ? 1 : 0,
                      color: _isTextFieldEnabled
                          ? AppColor.rBorderSideColor
                          : Colors.transparent),
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
                  enabled: _isTextFieldEnabled,
                  fillColor: AppColor.containerFillColor,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 13, bottom: 13),
                    child: Image.asset(
                      Assets.iconsEmailIcon,
                      height: 15,
                      width: 15,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  hint: "Enter your Email",
                  fontSize: AppConstant.fontSizeTwo,
                  borderSide: BorderSide(
                      width: _isTextFieldEnabled ? 1 : 0,
                      color: _isTextFieldEnabled
                          ? AppColor.rBorderSideColor
                          : Colors.transparent),
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
                        _isTextFieldEnabled
                            ? const CustomDropdown()
                            : Container(
                          width: screenWidth / 2.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // border:Border.all(width: 0.5, color: AppColor.rBorderSideColor),
                            color: AppColor.containerFillColor,
                          ),
                          height: 48,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12),
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
                            _isTextFieldEnabled? rvm.pickDate(context):();
                          },
                          enabled: false,
                          controller: rvm.dateController,
                          width: screenWidth / 2.3,
                          fillColor: AppColor.containerFillColor,
                          keyboardType: TextInputType.text,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(top: 13, bottom: 13),
                            child: Image.asset(
                              Assets.iconsCalenderIcon,
                              height: 15,
                              width: 15,
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
                          (i) =>
                          TextConst(
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
                  enabled: _isTextFieldEnabled,
                  fillColor: AppColor.containerFillColor,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 13, bottom: 13),
                    child: Image.asset(
                      Assets.iconsGreenCallIcon,
                      height: 15,
                      width: 15,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  hint: "+919122471133",
                  fontSize: AppConstant.fontSizeTwo,
                  borderSide: BorderSide(
                      width: _isTextFieldEnabled ? 1 : 0,
                      color: _isTextFieldEnabled
                          ? AppColor.rBorderSideColor
                          : Colors.transparent),
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
                  enabled: _isTextFieldEnabled,
                  fillColor: AppColor.containerFillColor,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 13, bottom: 13),
                    child: Image.asset(
                      Assets.iconsGreenCallIcon,
                      height: 15,
                      width: 15,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  hint: "+919122471133",
                  fontSize: AppConstant.fontSizeTwo,
                  borderSide: BorderSide(
                      width: _isTextFieldEnabled ? 1 : 0,
                      color: _isTextFieldEnabled
                          ? AppColor.rBorderSideColor
                          : Colors.transparent),
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
                  enabled: _isTextFieldEnabled,
                  fillColor: AppColor.containerFillColor,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 13, bottom: 13),
                    child: Image.asset(
                      Assets.iconsGreenCallIcon,
                      height: 15,
                      width: 15,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  hint: "+919122471133",
                  fontSize: AppConstant.fontSizeTwo,
                  borderSide: BorderSide(
                      width: _isTextFieldEnabled ? 1 : 0,
                      color: _isTextFieldEnabled
                          ? AppColor.rBorderSideColor
                          : Colors.transparent),
                ),
                AppConstant.spaceHeight20,
              ],
            ),
          ),
        ),
      );
    }
    );
  }
    }

