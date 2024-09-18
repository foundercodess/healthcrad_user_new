import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

class RequestLabReport extends StatefulWidget {
  const RequestLabReport({super.key});

  @override
  State<RequestLabReport> createState() => _RequestLabReportState();
}

int _selectedValue = 1;

class _RequestLabReportState extends State<RequestLabReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      bottomNavigationBar: ButtonConst(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.commonOrderScreen,
              arguments: {
                "name": "Your Request Report has been\nsubmitted successfully"
              });
        },
        borderRadius: BorderRadius.zero,
        color: AppColor.primaryColor,
        label: 'Request Report',
        textColor: AppColor.whiteColor,
        fontSize: AppConstant.fontSizeThree,
      ),
      appBar: AppBar(
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
                title: 'Request a Report',
                fontSize: AppConstant.fontSizeThree,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextConst(
                title: 'Test Receipt *',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.text,
                maxLength: 20,
                prefixIcon: Image.asset(
                  Assets.iconsUploadPdf,
                  scale: 1.9,
                  color: AppColor.primaryColor,
                ),
                hint: "Upload a valid test receipt",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                    BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
              ),
              AppConstant.spaceHeight15,
              TextConst(
                title: 'Pathlab Name *',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.text,
                maxLength: 20,
                prefixIcon: Image.asset(
                  Assets.iconsMedicalHome,
                  scale: 1.9,
                  color: AppColor.primaryColor,
                ),
                hint: "Enter pathlab name",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                    BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
              ),
              AppConstant.spaceHeight15,
              TextConst(
                title: 'Pathlab Address *',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.number,
                maxLength: 10,
                prefixIcon: Image.asset(
                  Assets.iconsLocatinIcon,
                  scale: 1.9,
                  color: AppColor.primaryColor,
                ),
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                hint: "Enter pathlab address",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                    BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
              ),
              AppConstant.spaceHeight15,
              TextConst(
                title: 'Enter Patient Name *',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.text,
                maxLength: 20,
                prefixIcon: Image.asset(
                  Assets.iconsName,
                  scale: 1.9,
                  color: AppColor.primaryColor,
                ),
                hint: "Enter Patient Name *",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                    BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
              ),
              AppConstant.spaceHeight15,
              TextConst(
                title: 'Patient Age *',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.text,
                maxLength: 20,
                prefixIcon: Image.asset(
                  Assets.iconsAge,
                  scale: 1.9,
                  color: AppColor.primaryColor,
                ),
                hint: "Enter patient age",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                    BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
              ),
              AppConstant.spaceHeight15,
              TextConst(
                title: 'Referred By *',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.number,
                maxLength: 10,
                prefixIcon: Image.asset(
                  Assets.iconsRefferd,
                  scale: 1.9,
                  color: AppColor.primaryColor,
                ),
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                hint: "Name of the person who referred",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                    BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
              ),
              AppConstant.spaceHeight15,
              TextConst(
                title: 'Test Date *',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextFieldConst(
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.number,
                maxLength: 10,
                prefixIcon: Image.asset(
                  Assets.iconsCalenderIcon,
                  scale: 1.9,
                  color: AppColor.primaryColor,
                ),
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                hint: "Enter test date",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                    BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
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
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.number,
                maxLength: 10,
                prefixIcon: Image.asset(
                  Assets.iconsGreenCallIcon,
                  scale: 1.9,
                  color: AppColor.primaryColor,
                ),
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                hint: "Enter phone number",
                fontSize: AppConstant.fontSizeTwo,
                borderSide:
                    BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
              ),
              AppConstant.spaceHeight15,
              TextConst(
                title: 'Test Payment *',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 radioButtonDesignCustom(1),
                  AppConstant.spaceWidth10,
                  TextConst(
                    title: 'Paid',
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  AppConstant.spaceWidth15,
                  AppConstant.spaceWidth15,
                 radioButtonDesignCustom(0),
                  AppConstant.spaceWidth10,
                  TextConst(
                    title: 'Unpaid',
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              AppConstant.spaceHeight25,
            ],
          ),
        ),
      ),
    );
  }
  Widget radioButtonDesignCustom(int index){
    return Container(
      height: 18,
      width: 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
          index == 0 ? AppColor.primaryColor : Colors.transparent,
          border: Border.all(
              color: index != 0
                  ? AppColor.greyColor
                  : Colors.transparent)),
      child: index == 0
          ? Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.whiteColor,
        ),
      )
          : const SizedBox.shrink(),
    );
  }
}
