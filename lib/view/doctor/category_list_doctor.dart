import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/doctor_view_model.dart';
import 'package:provider/provider.dart';

import '../../res/text_const.dart';

class CategoryTapListDoctor extends StatefulWidget {
  const CategoryTapListDoctor({super.key});

  @override
  State<CategoryTapListDoctor> createState() => _CategoryTapListDoctorState();
}

class _CategoryTapListDoctorState extends State<CategoryTapListDoctor> {
  @override
  Widget build(BuildContext context) {
    final doctorViewModel = Provider.of<DoctorViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.3,
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
              AppConstant.spaceWidth15,
              TextFieldConst(
                width: screenWidth / 1.3,
                height: 45,
                filled: true,
                fillColor: AppColor.whiteColor,
                keyboardType: TextInputType.text,
                maxLength: 35,
                maxLines: 1,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: SvgPicture.asset(
                    Assets.svgSearchIcons,
                    height: 10,
                    width: 10,
                  ),
                ),
                hint: "Find doctors...",
                fontSize: AppConstant.fontSizeTwo,
                sufixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: SvgPicture.asset(
                    Assets.svgMicIcons,
                    height: 10,
                    width: 10,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          AppConstant.spaceWidth5,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Image.asset(
                    Assets.iconsFiltterIcon,
                    scale: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: doctorViewModel.getDoctorModelData == null
          ? Utils.loading(): doctorViewModel.getDoctorModelData!.status.toString()=="400"?Utils.noDataFound()
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: doctorViewModel
                  .getDoctorModelData?.getDoctorModelData?.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: index == 0 ? 10 : 0, bottom: 10),
                  width: screenWidth,
                  color: AppColor.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: screenHeight * 0.11,
                              width: screenWidth * 0.25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(doctorViewModel
                                          .getDoctorModelData!
                                          .getDoctorModelData![index]
                                          .imgUrl
                                          .toString()),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(
                              width: screenWidth / 1.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: screenWidth * 0.55,
                                        child: TextConst(
                                          textAlign: TextAlign.start,
                                          title: doctorViewModel
                                              .getDoctorModelData
                                              ?.getDoctorModelData?[index]
                                              .name,
                                          maxLines: 1,
                                          fontSize: AppConstant.fontSizeThree,
                                          color: AppColor.blackColor,
                                          fontWeight: FontWeight.w600,
                                        ),
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
                                    title: doctorViewModel
                                        .getDoctorModelData
                                        ?.getDoctorModelData?[index]
                                        .departmentName,
                                    maxLines: 1,
                                    fontSize: AppConstant.fontSizeOne,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextConst(
                                    textAlign: TextAlign.start,
                                    title: doctorViewModel
                                        .getDoctorModelData
                                        ?.getDoctorModelData?[index]
                                        .qualification,
                                    maxLines: 1,
                                    fontSize: AppConstant.fontSizeOne,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  AppConstant.spaceHeight5,
                                  TextConst(
                                    title:
                                        '${doctorViewModel.getDoctorModelData?.getDoctorModelData?[index].exp} years experience',
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        AppConstant.spaceHeight15,
                        SizedBox(
                          width: screenWidth,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              int.parse((screenWidth / 5).toStringAsFixed(0)),
                              (i) => TextConst(
                                title: '-',
                                fontSize: 5,
                                color: AppColor.textColor.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        AppConstant.spaceHeight10,
                        Row(
                          children: [
                            Image.asset(
                              Assets.pngLocatinIcon,
                              height: 20,
                              width: 20,
                            ),
                            AppConstant.spaceWidth5,
                            TextConst(
                              title: doctorViewModel.getDoctorModelData
                                  ?.getDoctorModelData?[index].address
                                  .toString(),
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        AppConstant.spaceHeight10,
                        CustomRichText(textSpans: [
                          CustomTextSpan(
                              text:
                                  "• ₹ ${doctorViewModel.getDoctorModelData?.getDoctorModelData?[index].fees.toString()} ",
                              fontWeight: FontWeight.bold,
                              textColor: AppColor.blackColor,
                              fontSize: AppConstant.fontSizeTwo),
                          CustomTextSpan(
                              text: "Consultation Fees",
                              textColor: AppColor.blackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: AppConstant.fontSizeTwo)
                        ]),
                        AppConstant.spaceHeight15,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonConst(
                              width: screenWidth * 0.42,
                              height: screenHeight * 0.045,
                              onTap: () {
                                doctorViewModel.doctorVRApi(
                                    context,
                                    doctorViewModel.getDoctorModelData!
                                        .getDoctorModelData![index].id
                                        .toString());
                              },
                              border: Border.all(
                                  width: 1, color: AppColor.primaryColor),
                              label: 'View Profile',
                              textColor: AppColor.primaryColor,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.whiteColor,
                            ),
                                 ButtonConst(
                                    width: screenWidth * 0.42,
                                    height: screenHeight * 0.045,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RoutesName.slotPage);
                                    },
                                    color: AppColor.primaryColor,
                                    label: 'Book Appointment',
                                    textColor: AppColor.whiteColor,
                                    fontSize: AppConstant.fontSizeTwo,
                                  )

                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
