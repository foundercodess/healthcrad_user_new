import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/view_model/doctor_view_model.dart';
import 'package:provider/provider.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({super.key});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  int ratingValue = 3;


  @override
  Widget build(BuildContext context) {
    final doctorViewModel = Provider.of<DoctorViewModel>(context);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight * 0.32,
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
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  height: screenHeight * 0.028,
                  width: screenWidth * 0.33,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.imageVerifyDoctorBg),
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
                            title: doctorViewModel.doctorVRModel!.data!.name,
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeThree,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          AppConstant.spaceHeight10,
                          TextConst(
                            textAlign: TextAlign.start,
                            title:
                                doctorViewModel.doctorVRModel!.data!.department,
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                          TextConst(
                            textAlign: TextAlign.start,
                            title: doctorViewModel
                                .doctorVRModel!.data!.qualification,
                            maxLines: 1,
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                          AppConstant.spaceHeight10,
                          TextConst(
                            title:
                                '${doctorViewModel.doctorVRModel!.data!.exp} years experience',
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
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 15, left: 15),
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
                    title: doctorViewModel.doctorVRModel!.data!.address,
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
                    title: '₹ ${doctorViewModel.doctorVRModel!.data!.fees}',
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
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 15, left: 15),
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
                        height: 25,
                        width: 25,
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
                        height: 25,
                        width: 25,
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
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 15, left: 15),
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
                        doctorViewModel.doctorVRModel!.data!.about.toString(),
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConst(
                    textAlign: TextAlign.start,
                    title: 'Patient Review',
                    maxLines: 1,
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                  AppConstant.spaceHeight15,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        doctorViewModel.doctorVRModel!.doctorReview!.length,
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
                                    title: doctorViewModel.doctorVRModel!
                                        .doctorReview![index].userName
                                        ?.substring(0, 1)
                                        .toUpperCase(),
                                    maxLines: 1,
                                    fontSize: AppConstant.fontSizeThree,
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                AppConstant.spaceWidth10,
                                TextConst(
                                  textAlign: TextAlign.start,
                                  title: doctorViewModel.doctorVRModel!
                                      .doctorReview![index].userName,
                                  maxLines: 1,
                                  fontSize: AppConstant.fontSizeTwo,
                                  color: AppColor.blackColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                AppConstant.spaceWidth10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(5, (i) {
                                    int rating = int.tryParse(doctorViewModel
                                            .doctorVRModel!
                                            .doctorReview![index]
                                            .rating
                                            .toString()) ??
                                        0;
                                    return Icon(
                                      Icons.star_rounded,
                                      color: i < rating
                                          ? AppColor.yellowColor
                                          : AppColor.greyColor,
                                      size: 30,
                                    );
                                  }),
                                ),
                              ],
                            ),
                            AppConstant.spaceHeight5,
                            TextConst(
                              textAlign: TextAlign.start,
                              title: doctorViewModel
                                  .doctorVRModel!.doctorReview![index].message,
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
                                    color: AppColor.textColor.withOpacity(0.7),
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
