import 'dart:convert';

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
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view/path_lab/widgets/file_selection_bottomsheet.dart';
import 'package:provider/provider.dart';

import '../../view_model/path_view_model.dart';

class RequestLabReport extends StatefulWidget {
  const RequestLabReport({super.key});

  @override
  State<RequestLabReport> createState() => _RequestLabReportState();
}

int _selectedValue = 1;

class _RequestLabReportState extends State<RequestLabReport> {
  final TextEditingController pathLabNameCon = TextEditingController();
  final TextEditingController pathLabAddressCon = TextEditingController();
  final TextEditingController patientNameCon = TextEditingController();
  final TextEditingController referredByCon = TextEditingController();
  final TextEditingController ageCon = TextEditingController();
  final TextEditingController testDateCon = TextEditingController();
  final TextEditingController phoneNumberCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final pathViewModel = Provider.of<PathViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      bottomNavigationBar: ButtonConst(
        onTap: () {
          if (pathLabNameCon.text.isEmpty ) {
            Utils.show("Please enter Lab name", context);
          } else if (pathLabAddressCon.text.isEmpty) {
            Utils.show("Please enter Lab Address", context);
          } else if (patientNameCon.text.isEmpty) {
            Utils.show("Please enter  patient Name", context);
          } else if (referredByCon.text.isEmpty) {
            Utils.show("Please enter  referred Name", context);
          } else if (ageCon.text.isEmpty) {
            Utils.show("Please enter Age", context);
          } else if (testDateCon.text.isEmpty) {
            Utils.show("Please enter  Test Date", context);
          } else if (phoneNumberCon.text.isEmpty || phoneNumberCon.text.length ==10) {
            Utils.show("Please enter Phone Number", context);
          } else {
            pathViewModel.requestApi(
                pathLabNameCon.text,
                pathLabAddressCon.text,
                patientNameCon.text,
                ageCon.text,
                referredByCon.text,
                testDateCon.text,
                phoneNumberCon.text,
                payMode.toString(),
                context);
          }


        },
        loading: pathViewModel.loadingRequest,
        borderRadius: BorderRadius.zero,
        color: AppColor.primaryColor,
        label: 'Request Report',
        fontWeight: FontWeight.bold,
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                onTap: () {
                  print("sdbjbfjfe");
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return FileSelectionBottomSheet();
                      });
                },
                enabled: false,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.text,
                maxLength: 20,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Image.asset(
                    Assets.iconsUploadPdf,
                    height: 25,
                    width: 25,
                    color: AppColor.primaryColor,
                  ),
                ),
                hint: pathViewModel.imagePath ?? "Upload a valid test receipt",
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
                controller: pathLabNameCon,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.text,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Image.asset(
                    Assets.iconsMedicalHome,
                    height: 25,
                    width: 25,
                    color: AppColor.primaryColor,
                  ),
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
                controller: pathLabAddressCon,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.number,
                maxLength: 10,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Image.asset(
                    Assets.iconsLocatinIcon,
                    height: 25,
                    width: 25,
                    color: AppColor.primaryColor,
                  ),
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
                controller: patientNameCon,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.text,
                maxLength: 20,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Image.asset(
                    Assets.iconsName,
                    height: 25,
                    width: 25,
                    color: AppColor.primaryColor,
                  ),
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
                controller: ageCon,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.text,
                maxLength: 20,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Image.asset(
                    Assets.iconsAge,
                    height: 25,
                    width: 25,
                    color: AppColor.primaryColor,
                  ),
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
                controller: referredByCon,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.number,
                maxLength: 10,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Image.asset(
                    Assets.iconsRefferd,
                    height: 25,
                    width: 25,
                    color: AppColor.primaryColor,
                  ),
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
                controller: testDateCon,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.number,
                maxLength: 10,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Image.asset(
                    Assets.iconsCalenderIcon,
                    height: 25,
                    width: 25,
                    color: AppColor.primaryColor,
                  ),
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
                controller: phoneNumberCon,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.number,
                maxLength: 10,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Image.asset(
                    Assets.iconsGreenCallIcon,
                    height: 25,
                    width: 25,
                    color: AppColor.primaryColor,
                  ),
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
              SizedBox(
                width: screenWidth / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    radioButtonDesignCustom(0, "Paid"),
                    radioButtonDesignCustom(1, "Unpaid"),
                  ],
                ),
              ),
              AppConstant.spaceHeight25,
            ],
          ),
        ),
      ),
    );
  }

  int payMode = 0;
  Widget radioButtonDesignCustom(int index, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          payMode = index;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 18,
            width: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == payMode
                    ? AppColor.primaryColor
                    : Colors.transparent,
                border: Border.all(
                    color: index != payMode
                        ? AppColor.greyColor
                        : Colors.transparent)),
            child: index == payMode
                ? Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.whiteColor,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          AppConstant.spaceWidth5,
          TextConst(
            title: title,
            fontSize: AppConstant.fontSizeThree,
            color: AppColor.textColor,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
