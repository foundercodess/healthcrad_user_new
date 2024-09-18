import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({super.key});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight * 0.3,
        actions: [
          Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: 10),
            color: const Color(0xffF0FCFF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          Assets.iconsArrowBack,
                          scale: 3,
                          color: AppColor.blackColor,
                        )),
                    Container(
                      width: screenWidth * 0.08,
                      height: screenHeight * 0.04,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.shareBgColor,
                      ),
                      child: Image.asset(
                        Assets.iconsShareIcon,
                        color: AppColor.whiteColor,
                        scale: 3,
                      ),
                    ),
                  ],
                ),
                AppConstant.spaceHeight20,
                Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.036,
                  width: screenWidth * 0.37,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.imageVerifyDoctorBg),
                          fit: BoxFit.fill)),
                  child: TextConst(
                    textAlign: TextAlign.left,
                    title: 'HealthCRAD Verified',
                    maxLines: 1,
                    fontSize: AppConstant.fontSizeZero,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppConstant.spaceHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.6,
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppConstant.spaceHeight10,
                          TextConst(
                            title: 'Dr. Abhishek Kumar',
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeThree,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          AppConstant.spaceHeight10,
                          TextConst(
                            textAlign: TextAlign.start,
                            title: 'General Physician',
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                          TextConst(
                            textAlign: TextAlign.start,
                            title: 'MBBS, MD',
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                          AppConstant.spaceHeight10,
                          TextConst(
                            title: '25 years experience',
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.11,
                      width: screenWidth * 0.25,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(Assets.imageDoctorBg),
                              fit: BoxFit.fill)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.iconsMedicalHome,
                        scale: 1.9,
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
                  TextConst(
                    title: 'Appointment Fee',
                    maxLines: 1,
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  AppConstant.spaceHeight5,
                  TextConst(
                    title: '₹ 500',
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConst(
                    title: 'Highly Recommended for',
                    maxLines: 1,
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                  AppConstant.spaceHeight20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.iconsLoveHeart,
                        scale: 1.9,
                      ),
                      AppConstant.spaceWidth10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextConst(
                            textAlign: TextAlign.start,
                            title: 'Doctor Friendliness',
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                          AppConstant.spaceHeight5,
                          SizedBox(
                            width: screenWidth * 0.8,
                            child: TextConst(
                              textAlign: TextAlign.start,
                              title:
                                  'Your comfort and well-being are our top priority at every step of your care',
                              fontSize: AppConstant.fontSizeOne,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppConstant.spaceHeight20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.iconsFaqMore,
                        scale: 1.9,
                        color: AppColor.textColor,
                      ),
                      AppConstant.spaceWidth10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextConst(
                            textAlign: TextAlign.start,
                            title: 'Detailed Treatment Explanation',
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                          AppConstant.spaceHeight5,
                          SizedBox(
                            width: screenWidth * 0.8,
                            child: TextConst(
                              textAlign: TextAlign.start,
                              title:
                                  'Provides an in-depth analysis of the patient’s condition, outlining the recommended treatment plan, potential risks, and expected outcomes',
                              fontSize: AppConstant.fontSizeOne,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
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
                    textAlign: TextAlign.start,
                    title: 'About The Doctor',
                    maxLines: 1,
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                  AppConstant.spaceHeight5,
                  TextConst(
                    textAlign: TextAlign.start,
                    title:
                        'Dr G. Vilas Sharma is a highly experienced general physician and diabetes specialist in muzaffarpur, Bihar.',
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1, color: AppColor.textColor.withOpacity(0.3)),
                color: AppColor.whiteColor,
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal:15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextConst(
                        textAlign: TextAlign.start,
                        title: 'Patient Review',
                        maxLines: 1,
                        fontSize: AppConstant.fontSizeThree,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      AppConstant.spaceWidth15,
                      Container(
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.025,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.imageStarBg),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                  AppConstant.spaceHeight15,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColor.cAvtColor,
                                  child: TextConst(
                                    textAlign: TextAlign.start,
                                    title: 'A',
                                    maxLines: 1,
                                    fontSize: AppConstant.fontSizeThree,
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                AppConstant.spaceWidth10,
                                TextConst(
                                  textAlign: TextAlign.start,
                                  title: 'Aman Kumar',
                                  maxLines: 1,
                                  fontSize: AppConstant.fontSizeTwo,
                                  color: AppColor.blackColor,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            AppConstant.spaceHeight5,
                            TextConst(
                              textAlign: TextAlign.start,
                              title:
                                  "A comprehensive evaluation of the patient's experience with the healthcare provider, including aspects such as communication, treatment effectiveness, and overall satisfaction.",
                              fontSize: AppConstant.fontSizeOne,
                              color: AppColor.blackColor.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                            ),
                            AppConstant.spaceHeight25,
                            SizedBox(
                              width: screenWidth,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  int.parse(
                                      (screenWidth / 8).toStringAsFixed(0)),
                                  (i) => TextConst(
                                    title: '-',
                                    fontSize: AppConstant.fontSizeZero,
                                    color:
                                        AppColor.textColor.withOpacity(0.7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            AppConstant.spaceHeight5,
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
