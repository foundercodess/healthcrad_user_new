import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/view_model/ambulance_view_model.dart';
import 'package:provider/provider.dart';
import '../../res/app_btn.dart';
import '../../res/custom_rich_text.dart';
import '../../view_model/rating_view_model.dart';

class AmbulanceBookingHistory extends StatefulWidget {
  const AmbulanceBookingHistory({super.key});

  @override
  State<AmbulanceBookingHistory> createState() =>
      _AmbulanceBookingHistoryState();
}

class _AmbulanceBookingHistoryState extends State<AmbulanceBookingHistory> {
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Future.delayed(const Duration(milliseconds: 500), () {
  //       _showTooltip(ratingValue);
  //     });
  //   });

  //   Provider.of<AmbulanceViewModel>(context, listen: false)
  //       .ambulanceHistoryApi(context);
  // }

  @override
  Widget build(BuildContext context) {
    final ratingViewModel = Provider.of<RatingViewModel>(context);
    final ambulanceViewModel = Provider.of<AmbulanceViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.2,
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
              AppConstant.spaceWidth10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextConst(
                    title: 'My Booking',
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  TextConst(
                    title: 'Booking History',
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              child: Container(
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
          ),
        ],
      ),

      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20),
      //   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       AppConstant.spaceHeight30,
      //       TextConst(
      //         title: 'Nothing is here.',
      //         fontSize: AppConstant.fontSizeThree,
      //         color: AppColor.blackColor,
      //         fontWeight: FontWeight.w500,
      //       ),
      //       TextConst(
      //         title: 'Book your first ride now !',
      //         fontSize: AppConstant.fontSizeTwo,
      //         color: AppColor.blackColor.withOpacity(0.5),
      //         fontWeight: FontWeight.w400,
      //       ),
      //       AppConstant.spaceHeight180,
      //       Align(
      //         alignment: AlignmentDirectional.center,
      //         child: Container(
      //           height: screenWidth*0.35,
      //           width: screenWidth*0.45,
      //           decoration: const BoxDecoration(
      //             image: DecorationImage(
      //               image: AssetImage(
      //                 Assets.imageAmbuHistoryBg
      //               ),fit: BoxFit.fill
      //             )
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body:  ambulanceViewModel
          .ambulanceHistoryModel == null? CircularProgressIndicator():  ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: ambulanceViewModel
            .ambulanceHistoryModel!.ambulanceHistoryData!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: index == 0 ? 10 : 0, bottom: 10),
            width: screenWidth,
            color: AppColor.whiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "Booking Id : ",
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.blackColor,
                            fontSize: AppConstant.fontSizeOne),
                        CustomTextSpan(
                            text: ambulanceViewModel.ambulanceHistoryModel!
                                .ambulanceHistoryData![index].id
                                .toString(),
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeOne)
                      ]),
                      CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "Verification code : ",
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.blackColor,
                            fontSize: AppConstant.fontSizeOne),
                        CustomTextSpan(
                            text: "335900",
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeOne)
                      ]),
                    ],
                  ),
                  AppConstant.spaceHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextConst(
                              title: 'Name',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            TextConst(
                              title: 'Phone',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            TextConst(
                              title: 'Type',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            TextConst(
                              title: 'Distance',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      AppConstant.spaceWidth10,
                      SizedBox(
                        height: screenHeight * 0.12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextConst(
                              title: ':',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: ':',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: ':',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: ':',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      AppConstant.spaceWidth20,
                      SizedBox(
                        height: screenHeight * 0.12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextConst(
                              title: ambulanceViewModel.ambulanceHistoryModel!
                                  .ambulanceHistoryData![index].username,
                              maxLines: 1,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            TextConst(
                              title: ambulanceViewModel.ambulanceHistoryModel!
                                  .ambulanceHistoryData![index].phone
                                  .toString(),
                              maxLines: 1,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            TextConst(
                              title: ambulanceViewModel.ambulanceHistoryModel!
                                  .ambulanceHistoryData![index].ambulanceType,
                              maxLines: 1,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            TextConst(
                              title:
                                  '${ambulanceViewModel.ambulanceHistoryModel!.ambulanceHistoryData![index].distance} km',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppConstant.spaceHeight5,
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
                          color: AppColor.textColor.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  AppConstant.spaceHeight10,
                  Row(
                    children: [
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 15,
                              width: 14,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1, color: AppColor.blackColor)),
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                  Assets.imageLineBg,
                                ),
                                fit: BoxFit.fill,
                              )),
                            ),
                            Image.asset(
                              Assets.pngLocatinIcon,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      AppConstant.spaceWidth15,
                      SizedBox(
                        height: screenHeight * 0.077,
                        width: screenWidth * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextConst(
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              title: ambulanceViewModel.ambulanceHistoryModel!
                                  .ambulanceHistoryData![index].pickupAddress,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.addressColor,
                              fontWeight: FontWeight.w400,
                            ),
                            TextConst(
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              title: ambulanceViewModel.ambulanceHistoryModel!
                                  .ambulanceHistoryData![index].dropAddress,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.greenColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  AppConstant.spaceHeight15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonConst(
                        onTap: () {
                          // Navigator.pushNamed(context, RoutesName.verifyOtpScreen);
                        },
                        width: screenWidth * 0.44,
                        height: screenHeight * 0.04,
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.whiteColor,
                        border: Border.all(
                            width: 1,
                            color: AppColor.primaryColor.withOpacity(0.6)),
                        label: index == 0
                            ? 'Searching for driver'
                            : ambulanceViewModel.ambulanceHistoryModel!
                                .ambulanceHistoryData![index].driverName,
                        textColor: index == 0
                            ? AppColor.textColor.withOpacity(0.4)
                            : AppColor.primaryColor,
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                      ButtonConst(
                        onTap: () {},
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.041,
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.buttonBgColor,
                        border: Border.all(
                            width: 1,
                            color: AppColor.primaryColor.withOpacity(0.6)),
                        fontSize: AppConstant.fontSizeOne,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              Assets.iconsGreenCallIcon,
                              color: AppColor.whiteColor,
                              height: 20,
                              width: 20,
                            ),
                            TextConst(
                              title: 'Call to driver',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.whiteColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppConstant.spaceHeight15,
                  if (index == 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Assets.iconsAppoMore,
                          color: AppColor.blackColor.withOpacity(0.6),
                          height: 25,
                          width: 25,
                        ),
                        Expanded(
                          child: Container(
                            height: 8,
                            margin: const EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(
                                  5), // Outer container border radius
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  5), // Circular border for the progress indicator
                              child: LinearProgressIndicator(
                                value: 0.5, // Set progress value here
                                color: AppColor.primaryColor,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: index == 0
                        ? TextConst(
                            title: '02 min. 14 sec.',
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w400,
                          )
                        : null,
                  ),
                  AppConstant.spaceHeight15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index == 0
                          ? CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "Status : ",
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeTwo),
                              CustomTextSpan(
                                  text: "Wait for accept order",
                                  textColor: AppColor.textColor,
                                  fontSize: AppConstant.fontSizeTwo)
                            ])
                          : CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "Status : ",
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeTwo),
                              CustomTextSpan(
                                  text: "Journey completed",
                                  fontWeight: FontWeight.w500,
                                  textColor: AppColor.primaryColor,
                                  fontSize: AppConstant.fontSizeTwo)
                            ]),
                      index == 0
                          ? ButtonConst(
                              width: screenWidth * 0.26,
                              height: 30,
                              color: AppColor.whiteColor,
                              label: 'Cancel',
                              border: Border.all(
                                  width: 1, color: AppColor.redColor),
                              textColor: AppColor.redColor,
                              fontSize: AppConstant.fontSizeTwo,
                              fontWeight: FontWeight.w400,
                            )
                          : CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "vehicle No. : ",
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeOne),
                              CustomTextSpan(
                                  text: "BR/33H/8546",
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.textColor,
                                  fontSize: AppConstant.fontSizeOne)
                            ]),
                    ],
                  ),
                  if (index > 0) AppConstant.spaceHeight20,
                  if (index > 0)
                    CustomRichText(textSpans: [
                      CustomTextSpan(
                          text: "Do you have any problem?  ",
                          fontWeight: FontWeight.w400,
                          textColor: AppColor.blackColor,
                          fontSize: AppConstant.fontSizeOne),
                      CustomTextSpan(
                          text: "Call Now",
                          fontWeight: FontWeight.w600,
                          textColor: AppColor.primaryColor,
                          fontSize: AppConstant.fontSizeOne)
                    ]),
                  if (index > 0) AppConstant.spaceHeight20,
                  if (index > 0)
                    TextConst(
                      title: '• Rate your experience',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  if (index > 0) AppConstant.spaceHeight5,
                  if (index > 0)
                    ratingViewModel.rateWidget(context, "4",ambulanceViewModel.ambulanceHistoryModel!.ambulanceHistoryData![index].id.toString())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
