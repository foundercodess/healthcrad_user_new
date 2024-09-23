import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view/payments/widget/payment_mode_widget.dart';

class AppointmentBooking extends StatefulWidget {
  const AppointmentBooking({super.key});

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: AppColor.whiteColor,
          border: Border(
            top: BorderSide(width:0.3, color: AppColor.greyColor)
          )
        ),
        height: screenHeight * 0.075,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextConst(
                title: '₹ 550',
                fontSize: AppConstant.fontSizeTwo,
                color: AppColor.blackColor,
                fontWeight: FontWeight.bold,
              ),
              ButtonConst(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.commonOrderScreen,
                      arguments: {
                        "name": "Your appointment has been\nsuccessfully booked"
                      });
                },
                label:"Request Appointment",

                width: screenWidth/2,
                height: 40,
                fontWeight: FontWeight.w600,
              textColor: AppColor.whiteColor,
              ),
              // GestureDetector(
              //
              //   child: Container(
              //     alignment: Alignment.center,
              //     height: screenHeight * 0.05,
              //     width: screenWidth * 0.5,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: Colors.blue,
              //     ),
              //     child: TextConst(
              //       title: 'Request Appointment',
              //       fontSize: AppConstant.fontSizeTwo,
              //       color: AppColor.whiteColor,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
      // backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        automaticallyImplyLeading: false,
        leadingWidth: screenWidth,
        leading:  Container(
          width: screenWidth,
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Assets.iconsMedicalHome,
                    color: AppColor.whiteColor,
                    width: 20,
                  ),
                  AppConstant.spaceWidth10,
                  TextConst(
                    title: 'Book Appointment',
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Container(
            height: screenHeight * 0.038,
            width: screenWidth * 0.28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.whiteColor,
                image: const DecorationImage(
                    image: AssetImage(Assets.iconsPSecureIcons),
                    fit: BoxFit.fill))
          ),
          AppConstant.spaceWidth15,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
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
                      width: screenWidth * 0.6,
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextConst(
                                title: 'Dr. Abhishek Kumar',
                                maxLines: 1,
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                              const Icon(
                                Icons.check_circle,
                                color: Colors.grey,
                                size: 20.0,
                              )
                            ],
                          ),
                          AppConstant.spaceHeight5,
                          TextConst(
                            textAlign: TextAlign.start,
                            title: 'General Physician \nMBBS, MD',
                            maxLines: 2,
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                          TextConst(
                            title: '35 years experience',
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                          AppConstant.spaceHeight10,
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            height: screenHeight * 0.028,
                            width: screenWidth * 0.33,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        Assets.imageVerifyDoctorBg),
                                    fit: BoxFit.fill)),
                            child: TextConst(
                              title: 'HealthCRAD Verified',
                              maxLines: 1,
                              fontSize: 9,
                              textAlign: TextAlign.start,
                              color: AppColor.whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          // Container(
                          //   alignment: Alignment.center,
                          //   height: screenHeight * 0.034,
                          //   width: screenWidth * 0.35,
                          //   decoration: const BoxDecoration(
                          //       image: DecorationImage(
                          //           image:
                          //               AssetImage(Assets.imageVerifyDoctorBg),
                          //           fit: BoxFit.fill)),
                          //   child: TextConst(
                          //     title: 'HealthCRAD Verified',
                          //     maxLines: 1,
                          //     fontSize: AppConstant.fontSizeZero,
                          //     color: AppColor.whiteColor,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.iconsMedicalHome,
                        height: 25,
                        width: 25,
                      ),
                      AppConstant.spaceWidth10,
                      TextConst(
                        title: 'Clinic address',
                        maxLines: 1,
                        fontSize: AppConstant.fontSizeOne,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  AppConstant.spaceHeight5,
                  TextConst(
                    title: 'Line bazar, Purnea, Bihar',
                    maxLines: 1,
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  AppConstant.spaceHeight10,
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
                  AppConstant.spaceHeight10,
                  Row(
                    children: [
                      Container(
                          height: 15,
                          width: 15,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.blueColor,
                          ),
                          child: Icon(
                            Icons.check,
                            color: AppColor.whiteColor,
                            size: 10.0,
                          )),
                      AppConstant.spaceWidth5,
                      CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "HealthCRAD assured ",
                            textColor: AppColor.blueColor,
                            fontSize: AppConstant.fontSizeOne),
                        CustomTextSpan(
                            text: '- Appointment confirm shortly',
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeOne)
                      ]),
                    ],
                  ),
                ],
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.iconsAppoMore,
                        height: 25,
                        width: 25,
                        color: AppColor.textColor,
                      ),
                      AppConstant.spaceWidth10,
                      TextConst(
                        title: 'Appointment time & date',
                        maxLines: 1,
                        fontSize: AppConstant.fontSizeOne,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  AppConstant.spaceHeight5,
                  TextConst(
                    title: 'Fri, 2 Aug 11:00 AM',
                    maxLines: 1,
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConst(
                    title: 'Fill patient details',
                    maxLines: 1,
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  AppConstant.spaceHeight15,
                  TextFieldConst(
                    fillColor: AppColor.whiteColor,
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 13,bottom: 13),
                      child: Image.asset(
                        Assets.iconsName,
                        height: 15,
                        width: 15,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    hint: "Patient name",
                    fontSize: AppConstant.fontSizeTwo,
                    borderSide: BorderSide(
                        width: 1, color: AppColor.textColor.withOpacity(0.3)),
                  ),
                  AppConstant.spaceHeight10,
                  TextFieldConst(
                    fillColor: AppColor.whiteColor,
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 13,bottom: 13),
                      child: Image.asset(
                        Assets.iconsHome,
                        height: 15,
                        width: 15,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    hint: "Address",
                    fontSize: AppConstant.fontSizeTwo,
                    borderSide: BorderSide(
                        width: 1, color: AppColor.textColor.withOpacity(0.3)),
                  ),
                  AppConstant.spaceHeight10,
                  TextFieldConst(
                    fillColor: AppColor.whiteColor,
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 13,bottom: 13),
                      child: Image.asset(
                        Assets.iconsAge,
                        height: 15,
                        width: 15,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    hint: "Age",
                    fontSize: AppConstant.fontSizeTwo,
                    borderSide: BorderSide(
                        width: 1, color: AppColor.textColor.withOpacity(0.3)),
                  ),
                  AppConstant.spaceHeight10,
                  TextFieldConst(
                    fillColor: AppColor.whiteColor,
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
                    hint: "Phone Number",
                    fontSize: AppConstant.fontSizeTwo,
                    borderSide: BorderSide(
                        width: 1, color: AppColor.textColor.withOpacity(0.3)),
                  ),
                ],
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              color: AppColor.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConst(
                    title: 'Payment details',
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  AppConstant.spaceHeight10,
                  SizedBox(
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextConst(
                              title: 'Consultation Fee',
                              fontSize: AppConstant.fontSizeOne,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            AppConstant.spaceHeight5,
                            TextConst(
                              title: 'Service fee & tax',
                              fontSize: AppConstant.fontSizeOne,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextConst(
                              title: '₹ 500',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "₹45",
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.textColor,
                                  fontSize: AppConstant.fontSizeTwo),
                              CustomTextSpan(
                                  text: "  Free",
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.greenColor,
                                  fontSize: AppConstant.fontSizeTwo)
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppConstant.spaceHeight10,
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
                  AppConstant.spaceHeight10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextConst(
                          title: 'Total Payable',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                        ),
                        TextConst(
                          title: '₹ 500',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  AppConstant.spaceHeight15,
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.04,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.imageGreenDotBg),
                            fit: BoxFit.fill)),
                    child: TextConst(
                      title: 'You will save ₹ 45 on this appointment',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.greenColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.iconsPaymentIcon,
                          height: 25,
                          width: 25,
                        ),
                        AppConstant.spaceWidth15,
                        TextConst(
                          title: 'Payment Mode',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    AppConstant.spaceHeight10,
                    const PaymentModeWidget(
                      title: "Pay on Visit",
                      index: 0,
                    ),
                    const PaymentModeWidget(
                      title: "Online Payment",
                      index: 1,
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: screenWidth / 6,
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffECF2FF)),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: -8,
                            child: Image.asset(
                              Assets.iconsSafeIconOnly,
                              width: 16,
                            ),
                          ),
                          TextConst(
                            title: '  Safe VISIT',
                            fontSize: AppConstant.fontSizeZero,
                            color: const Color(0xff062880),
                          ),
                        ],
                      ),
                    ),
                    AppConstant.spaceHeight10,
                    TextConst(
                      title: '●  Mask mandatory',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.textColor,
                    ),
                    AppConstant.spaceHeight5,
                    TextConst(
                      title: '●  Social distance maintained',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.textColor,
                    ),
                    AppConstant.spaceHeight5,
                    TextConst(
                      title: '●  Sanitization of the visitors',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.textColor,
                    ),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
          ],
        ),
      ),
    );
  }
}
