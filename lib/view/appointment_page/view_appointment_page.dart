import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/common_rating_popup.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view_model/rating_view_model.dart';
import 'package:provider/provider.dart';

class ViewAppointmentPage extends StatefulWidget {
  const ViewAppointmentPage({super.key});

  @override
  State<ViewAppointmentPage> createState() => _ViewAppointmentPageState();
}

class _ViewAppointmentPageState extends State<ViewAppointmentPage> {

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final ratingViewModel = Provider.of<RatingViewModel>(context, listen: false);
  //     Future.delayed(const Duration(milliseconds: 500), () {
  //       ratingViewModel.setRatingValue(2);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final ratingViewModel = Provider.of<RatingViewModel>(context);
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
                title: 'Appointment details',
                fontSize: AppConstant.fontSizeThree,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstant.spaceHeight20,
              TextConst(
                title: 'Upcoming Appointment, General Physician',
                fontSize: AppConstant.fontSizeTwo,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight20,
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
                      text: 'Confirmation Pending',
                      textColor: AppColor.orangeColor,
                      fontWeight: FontWeight.w600,
                      fontSize: AppConstant.fontSizeTwo)
                ]),
              ),
              AppConstant.spaceHeight20,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      width: 1.2, color: AppColor.greyColor.withOpacity(0.2)),
                  // color: Colors.red,
                ),
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstant.spaceHeight10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextConst(
                        title: 'Requested Appointment Time',
                        fontSize: AppConstant.fontSizeOne,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppConstant.spaceHeight10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextConst(
                        title: '2 Aug 2024, 11:00 AM',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AppConstant.spaceHeight10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppConstant.spaceHeight15,
                              TextConst(
                                title: 'Dr. Shubham Kumar',
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w600,
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
                                title: 'Booked for - Om Shankar Sharma',
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
                              height: screenWidth / 4.5,
                              width: screenWidth / 4.5,
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
                        children: List.generate(
                          int.parse((screenWidth / 8).toStringAsFixed(0)),
                          (i) => TextConst(
                            title: '-',
                            fontSize: AppConstant.fontSizeZero,
                            color: AppColor.textColor.withOpacity(0.3),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    AppConstant.spaceHeight5,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.pngLocatinIcon,
                            height: 15,
                            width: 15,
                          ),
                          AppConstant.spaceWidth5,
                          TextConst(
                            title: 'Line bazar, Purnea, Bihar',
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    AppConstant.spaceHeight15,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonConst(
                            onTap: () {

                            },
                            width: screenWidth * 0.35,
                            height: screenHeight * 0.043,
                            color: AppColor.primaryColor,
                            fontSize: AppConstant.fontSizeTwo,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  Assets.iconsAddressMore,
                                  height: 15,
                                  width: 15,
                                  color: AppColor.whiteColor,
                                ),
                                TextConst(
                                  title: 'Direction',
                                  fontSize: AppConstant.fontSizeTwo,
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          ButtonConst(
                            onTap: () {

                            },
                            width: screenWidth * 0.35,
                            height: screenHeight * 0.043,
                            color: AppColor.primaryColor,
                            fontSize: AppConstant.fontSizeTwo,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  Assets.iconsGreenCallIcon,
                                  height: 15,
                                  width: 15,
                                  color: AppColor.whiteColor,
                                ),
                                TextConst(
                                  title: 'Contact',
                                  fontSize: AppConstant.fontSizeTwo,
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppConstant.spaceHeight10,
                  ],
                ),
              ),
              AppConstant.spaceHeight20,
              TextConst(
                title: 'Booking Details',
                fontSize: AppConstant.fontSizeTwo,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w500,
              ),
              AppConstant.spaceHeight15,
              TextConst(
                title: 'Patient',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w400,
              ),
              AppConstant.spaceHeight5,
              TextConst(
                title: 'Om Shankar Sharma',
                fontSize: AppConstant.fontSizeTwo,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight5,
              TextConst(
                title: '+91-9365524875',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.textColor,
                fontWeight: FontWeight.w400,
              ),
              AppConstant.spaceHeight10,
              Container(
                height: 1,
                color: AppColor.greyColor.withOpacity(0.3),
              ),
              AppConstant.spaceHeight10,
              TextConst(
                title: 'Appointment ID',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w400,
              ),
              AppConstant.spaceHeight5,
              TextConst(
                title: '197845',
                fontSize: AppConstant.fontSizeTwo,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight10,
              Container(
                height: 1,
                color: AppColor.greyColor.withOpacity(0.3),
              ),
              AppConstant.spaceHeight10,
              TextConst(
                title: 'Appointment Fee',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w400,
              ),
              AppConstant.spaceHeight5,
              TextConst(
                title: '₹ 500',
                fontSize: AppConstant.fontSizeTwo,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              AppConstant.spaceHeight20,
              TextConst(
                title: '• Rate your experience',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w400,
              ),
              AppConstant.spaceHeight5,
              ratingViewModel.rateWidget(context,"1","1"),
              AppConstant.spaceHeight50,
              AppConstant.spaceHeight20
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppColor.whiteColor,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonConst(
              label: "Give feedback to doctor",
              width: screenWidth / 2,
              textColor: AppColor.whiteColor,
              height: 35,
              color: AppColor.primaryColor,
            ),
            ButtonConst(
              label: "Cancel Appointment",
              width: screenWidth / 2.5,
              textColor: AppColor.redColor,
              height: 35,
              color: Colors.transparent,
              border: Border.all(color: AppColor.redColor, width: 1),
            ),
          ],
        ),
      ),
    );
  }
}
