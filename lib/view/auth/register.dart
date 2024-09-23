import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/Auth_res/auth_bg.dart';
import 'package:health_crad_user/res/Auth_res/auth_screen_bg.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/drop_down.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/auth_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> {
  @override
void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      Map arguments =
      ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      mobileCon.text=arguments['phone'];
      });
  }
  final emailPattern =
  RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  final TextEditingController mobileCon = TextEditingController();
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  // final TextEditingController genderCon = TextEditingController();
  // final TextEditingController dobCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Consumer<AuthViewModel>(builder: (context, rvm, child) {
      return AuthScreenBg(
        column: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstant.spaceHeight15,
            TextConst(
              title: 'Name *',
              fontSize: AppConstant.fontSizeOne,
              color: AppColor.blackColor,
              fontWeight: FontWeight.w600,
            ),
            AppConstant.spaceHeight5,
            TextFieldConst(
              controller: nameCon,
              fillColor: AppColor.containerFillColor,
              keyboardType: TextInputType.text,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 13,bottom: 13),
                child: Image.asset(
                  Assets.iconsName,
                  height: 15,
                  width: 15,
                  color: AppColor.primaryColor,
                ),
              ),
              hint: "Enter your name",
              fontSize: AppConstant.fontSizeTwo,
              borderSide:
                  BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
            ),
            AppConstant.spaceHeight15,
            TextConst(
              fontWeight: FontWeight.w600,
              title: 'Phone Number *',
              fontSize: AppConstant.fontSizeOne,
              color: AppColor.blackColor,
            ),
            AppConstant.spaceHeight5,
            TextFieldConst(
              readOnly: true,
              controller: mobileCon,
              fillColor: AppColor.containerFillColor,
              keyboardType: TextInputType.number,
              maxLength: 10,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 13,bottom: 13),
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
              borderSide:
                  BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
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
                  fontSize: AppConstant.fontSizeZero)
            ]),
            AppConstant.spaceHeight5,
            TextFieldConst(
              controller: emailCon,
              fillColor: AppColor.containerFillColor,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 13,bottom: 13),
                child: Image.asset(
                  Assets.iconsEmailIcon,
                  height: 15,
                  width: 15,
                  color: AppColor.primaryColor,
                ),
              ),
              hint: "Enter your Email",
              fontSize: AppConstant.fontSizeTwo,
              borderSide:
                  BorderSide(width: 0.5, color: AppColor.rBorderSideColor),
            ),
            AppConstant.spaceHeight15,
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
                    const CustomDropdown(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRichText(textSpans: [
                      CustomTextSpan(
                          text: "Data of Birth ",
                          textColor: AppColor.blackColor,
                          fontSize: AppConstant.fontSizeOne,
                        fontWeight: FontWeight.w600,),
                      CustomTextSpan(
                          text: "(Optional)",
                          textColor: AppColor.textColor,
                          fontSize: AppConstant.fontSizeZero)
                    ]),
                    AppConstant.spaceHeight5,
                    TextFieldConst(
                      onTap: () {
                        rvm.pickDate(context);
                      },
                      enabled: false,
                      width: screenWidth / 2.3,
                      fillColor: AppColor.containerFillColor,
                      keyboardType: TextInputType.text,
                      controller: rvm.dateController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 13,bottom: 13),
                        child: Image.asset(
                          Assets.iconsCalenderIcon,
                          height: 15,
                          width: 15,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      hint: "Enter Dob",
                      fontSize: AppConstant.fontSizeTwo,
                      borderSide: BorderSide(
                          width: 0.5, color: AppColor.rBorderSideColor),
                    ),
                  ],
                ),
              ],
            ),
            AppConstant.spaceHeight20,
            ButtonConst(
              onTap: () {

                if(nameCon.text.isEmpty){
                  Utils.show("Please enter your name", context);
                }else if(rvm.isSelectedValue.isEmpty){
                  Utils.show("Please enter your age", context);
                }
                else if (
                    !emailPattern.hasMatch(emailCon.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please Enter Valid Email'),
                    ),
                  );
                }else if (rvm.pickedDate ==null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please Enter Valid DOB'),
                    ),
                  );
                }
                else{
                  Map data = {
                    "mobileno": mobileCon.text,
                    "name": nameCon.text,
                    "email": emailCon.text,
                    "gender": rvm.isSelectedValue,
                    "dob": DateFormat('dd-MM-yyyy').format(rvm.pickedDate!),

                  };
                  authViewModel.registerApi(data, context);

                }

              },
              loading: authViewModel.loadingRegister,
              color: AppColor.primaryColor,
              label: 'Continue',
              textColor: AppColor.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: AppConstant.fontSizeThree,
            ),
            AppConstant.spaceHeight15,
            CustomRichText(textSpans: [
              CustomTextSpan(
                  text: "By continuing, you agree to our ",
                  textColor: AppColor.blackColor,
                  fontSize: AppConstant.fontSizeOne),
              CustomTextSpan(
                  text: 'Terms & Conditions',
                  textColor: AppColor.primaryColor,
                  fontSize: AppConstant.fontSizeOne)
            ]),
            const Spacer(),
            AuthImage(
              height: screenHeight * 0.24,
            ),
          ],
        ),
        title: "Sign-Up",
        subTitle: "Fill some basic details and create new account",
      );
    });
  }
}
