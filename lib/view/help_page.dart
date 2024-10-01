import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view/more/widget/common_app_bar_more.dart';
import 'package:health_crad_user/view_model/help_view_model.dart';
import 'package:provider/provider.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final TextEditingController mobileCon = TextEditingController();
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController messageCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final helpViewModel = Provider.of<HelpViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: const CommonAppBarMore(
        title: 'Support',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextConst(
                textAlign: TextAlign.start,
                title: "HOW MAY WE\nHELP YOU?",
                fontSize: AppConstant.fontSizeHeading,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight20,
              TextConst(
                title: "Request a call",
                fontSize: AppConstant.fontSizeTwo,
                color: AppColor.textColor,
                fontWeight: FontWeight.w500,
              ),
              AppConstant.spaceHeight50,
              TextFieldConst(
                controller: nameCon,
                fillColor: AppColor.containerFillColor,
                keyboardType: TextInputType.text,
                borderSide: BorderSide(color: AppColor.rBorderSideColor),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 13, bottom: 13),
                  child: Image.asset(
                    Assets.iconsName,
                    height: 15,
                    width: 15,
                    color: AppColor.primaryColor,
                  ),
                ),
                hint: "Your name",
                fontSize: AppConstant.fontSizeTwo,
              ),
              AppConstant.spaceHeight10,
              TextFieldConst(
                controller: mobileCon,
                borderSide: BorderSide(color: AppColor.rBorderSideColor),
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
                hint: "Phone No.",
                fontSize: AppConstant.fontSizeTwo,
              ),
              AppConstant.spaceHeight10,

              AppConstant.spaceHeight10,
              Container(
                width: screenWidth,
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: AppColor.rBorderSideColor),
                  color: AppColor.containerFillColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 20,
                        child: Image.asset(Assets.pngMessageIcon,scale: 2,)),
                    Expanded(
                      child: TextField(
                        controller: messageCon,
                        minLines: 4,
                        maxLines: null,
                        decoration: InputDecoration(
                          fillColor: AppColor.containerFillColor,
                          border: InputBorder.none,
                          hintText: 'Write Your Message',
                          hintStyle: TextStyle(color: AppColor.textColor, fontSize: AppConstant.fontSizeTwo, fontFamily:  "Poppins_Regular",),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              AppConstant.spaceHeight50,
              ButtonConst(
                onTap: () {
                  if (nameCon.text.isEmpty) {
                    Utils.show("Please enter your name", context);
                  } else if (mobileCon.text.isEmpty){
                    Utils.show("Please enter your phone No.", context);
                  }else if (messageCon.text.isEmpty){
                    Utils.show("Please enter your Message", context);
                  }

                  else {
                    helpViewModel.helpApi(
                        nameCon.text, mobileCon.text, messageCon.text, context);
                  }
                },
                loading: helpViewModel.loadingHelp,
                color: AppColor.primaryColor,
                label: 'Submit',
                textColor: AppColor.whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: AppConstant.fontSizeThree,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
