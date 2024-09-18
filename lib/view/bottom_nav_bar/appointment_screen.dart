import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        leadingWidth: screenWidth,
        backgroundColor: AppColor.primaryColor,
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
                title: 'My Appointment',
                fontSize: AppConstant.fontSizeThree,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              // onTap: () {
              //   showDialog(
              //     context: context,
              //     barrierDismissible: false,
              //     barrierColor: Colors.transparent,
              //     builder: (BuildContext context) {
              //       return FilterPopup(
              //
              //
              //       );
              //     },
              //   );
              // },
              child: Row(
                children: [
                  Image.asset(
                    Assets.iconsFiltterIcon,
                    scale: 3,
                  ),
                  AppConstant.spaceWidth5,
                  TextConst(
                    title: 'Filter',
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w500,
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
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            width: screenWidth,
            color: AppColor.whiteColor,
            child: Padding(
              padding: EdgeInsets.only(
                  top: index == 0 ? 15 : 0, left: 15, right: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      width: 0.5, color: AppColor.greyColor),
                  // color: Colors.red,
                ),
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenHeight * 0.06,
                      width: screenWidth,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        color: AppColor.listColorAppointment,
                      ),
                      child: CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "Status: ",
                            textColor: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppConstant.fontSizeTwo),
                        CustomTextSpan(
                            text:index==0? 'Confirmation Pending':"Attended",
                            textColor:index==0? AppColor.orangeColor:AppColor.greenColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppConstant.fontSizeTwo)
                      ]),
                    ),
                    AppConstant.spaceHeight10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextConst(
                        title: '2 Aug 11:00 AM',
                        fontSize: AppConstant.fontSizeOne,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppConstant.spaceHeight10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextConst(
                                title: 'Appointment to, General Physician',
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                              AppConstant.spaceHeight15,
                              TextConst(
                                title: 'Dr. Shubham Kumar',
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                              AppConstant.spaceHeight5,
                              TextConst(
                                title: 'General Physician, MBBS, MD',
                                fontSize: AppConstant.fontSizeOne,
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                              ),
                              TextConst(
                                title: '35 years experience',
                                fontSize: AppConstant.fontSizeOne,
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                              ),
                              AppConstant.spaceHeight10,
                              TextConst(
                                title: 'Line bazar, Purnea, Bihar',
                                fontSize: AppConstant.fontSizeOne,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          AppConstant.spaceHeight10,
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.2,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(Assets.imageDoctorBg),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppConstant.spaceHeight5,
                    Container(
                      width: screenWidth,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(int.parse((screenWidth/8).toStringAsFixed(0)), (i)=>TextConst(
                          title:
                          '-',
                          fontSize: AppConstant.fontSizeZero,
                          color: AppColor.textColor.withOpacity(0.3),
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ),
                    AppConstant.spaceHeight5,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.45,
                            child: TextConst(
                              textAlign: TextAlign.start,
                              title: 'Booked for Om Shankar Kumar',
                              fontSize: AppConstant.fontSizeOne,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          ButtonConst(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.viewAppointmentPage);
                            },
                            width: screenWidth * 0.38,
                            height: screenHeight * 0.048,
                            color: AppColor.primaryColor,
                            label: 'View Details',
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.whiteColor,
                            fontSize: AppConstant.fontSizeTwo,
                          ),
                        ],
                      ),
                    ),
                    AppConstant.spaceHeight10,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
