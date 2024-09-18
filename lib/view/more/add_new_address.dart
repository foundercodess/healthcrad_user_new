import 'package:flutter/material.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';

import '../../generated/assets.dart';
import '../../res/app_color.dart';
import '../../res/app_constant.dart';
import '../../res/custom_text_field.dart';
import '../../res/text_const.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leadingWidth: screenWidth,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              InkWell(
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
                title: 'Add Address',
                fontSize: AppConstant.fontSizeThree,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
        child: Column(
          children: [
            commonTextField("Full Name (Required)*"),
            AppConstant.spaceHeight15,
            commonTextField("Patient Name (Required)*"),
            AppConstant.spaceHeight15,
            commonTextField("Phone Name (Required)*"),
            AppConstant.spaceHeight15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonTextField("Pin code (Required)*",width: screenWidth/2.2),
                commonTextField("State (Required)*",width: screenWidth/2.2),
              ],
            ),
            AppConstant.spaceHeight15,
            commonTextField("City (Required)*"),
            AppConstant.spaceHeight15,
            commonTextField("House No., Building Name (Required)*"),
            AppConstant.spaceHeight15,
            commonTextField("Road, Area, colony (Required)*"),
          ],
        ),
      ),
      bottomSheet: ButtonConst(label: "Save",color: AppColor.primaryColor,textColor: AppColor.whiteColor,fontWeight: FontWeight.w600,fontSize: AppConstant.fontSizeThree,),
    );
  }

  Widget commonTextField(String hint, {TextEditingController? textCon, TextInputType keyboardType=TextInputType.text,double? width}){
    return TextFieldConst(
      width: width,
      controller: textCon,
      fillColor: AppColor.whiteColor,
      keyboardType: keyboardType,
      hint: hint,
      fontSize: AppConstant.fontSizeTwo,
      borderSide:
      BorderSide(width: 1, color: AppColor.textColor.withOpacity(0.5)),
    );
  }
}
