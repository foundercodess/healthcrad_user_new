import 'package:flutter/material.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/address_view_model.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController pNameCon = TextEditingController();
  final TextEditingController pAgeCon = TextEditingController();
  final TextEditingController pPhoneCon = TextEditingController();
  final TextEditingController pinCodeCon = TextEditingController();
  final TextEditingController stateCon = TextEditingController();
  final TextEditingController cityCon = TextEditingController();
  final TextEditingController addressCon = TextEditingController();
  final TextEditingController subAddressCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addressViewModel = Provider.of<AddressViewModel>(context);
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                commonTextField("Full Name (Required)*", textCon: nameCon),
                AppConstant.spaceHeight15,
                commonTextField("Patient Name (Required)*", textCon: pNameCon),
                AppConstant.spaceHeight15,
                commonTextField("Patient Age (Required)*", textCon: pAgeCon,keyboardType: TextInputType.number,maxLength: 2),
                AppConstant.spaceHeight15,
                commonTextField("Phone Number (Required)*", textCon: pPhoneCon,keyboardType: TextInputType.number,maxLength: 10),
                AppConstant.spaceHeight15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonTextField("Pin code (Required)*",
                        width: screenWidth / 2.2, textCon: pinCodeCon,keyboardType: TextInputType.number,maxLength: 6),
                    commonTextField("State (Required)*",
                        width: screenWidth / 2.2, textCon: stateCon),
                  ],
                ),
                AppConstant.spaceHeight15,
                commonTextField("City (Required)*", textCon: cityCon),
                AppConstant.spaceHeight15,
                commonTextField("House No., Building Name (Required)*",
                    textCon: addressCon),
                AppConstant.spaceHeight15,
                commonTextField("Road, Area, colony (Required)*",
                    textCon: subAddressCon),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: ButtonConst(
        onTap: (){
          if(nameCon.text.isEmpty ||nameCon.text.length <2 ){
            Utils.show("Please enter valid name", context);
          }else if(pNameCon.text.isEmpty ||  pNameCon.text.length <2){
            Utils.show("Please enter valid patient Name", context);
          }else if(pAgeCon.text.isEmpty  ||pAgeCon.text.length > 2 ){
            Utils.show("Please enter valid patient Age", context);
          }else if(pPhoneCon.text.isEmpty || pPhoneCon.text.length != 10){
            Utils.show("Please enter valid Mobile No", context);
          }else if(pinCodeCon.text.isEmpty){
            Utils.show("Please enter valid PinCode", context);
          }else if(stateCon.text.isEmpty){
            Utils.show("Please enter valid State Name", context);
          }
          else if(cityCon.text.isEmpty){
            Utils.show("Please enter valid City Name", context);
          }else if(addressCon.text.isEmpty){
            Utils.show("Please enter valid Landmark", context);
          }else if(subAddressCon.text.isEmpty){
            Utils.show("Please enter valid Address", context);
          }



          else{
            addressViewModel.addAddressApi(nameCon.text,pNameCon.text,pinCodeCon.text,stateCon.text,cityCon.text,addressCon.text,subAddressCon.text,pPhoneCon.text,context);

          }

        },
        label: "Save",
        color: AppColor.primaryColor,
        textColor: AppColor.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: AppConstant.fontSizeThree,
      ),
    );
  }

  Widget commonTextField(String hint,
      {required TextEditingController textCon,
      TextInputType keyboardType = TextInputType.text,
      double? width,int? maxLength} ) {
    return TextFieldConst(
      maxLength: maxLength,
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
