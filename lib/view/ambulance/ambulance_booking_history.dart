import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';

import '../../res/app_btn.dart';
import '../../res/custom_rich_text.dart';

class AmbulanceBookingHistory extends StatefulWidget {
  const AmbulanceBookingHistory({super.key});

  @override
  State<AmbulanceBookingHistory> createState() =>
      _AmbulanceBookingHistoryState();
}

class _AmbulanceBookingHistoryState extends State<AmbulanceBookingHistory> {
  List<int> starList = [1, 2, 3, 4, 5];

  final ratingOption = ["very poor", "poor", "average", "good", "excellent"];
  int ratingValue = 3;
  final List<GlobalKey<TooltipState>> _tooltipKeys =
  List.generate(5, (_) => GlobalKey<TooltipState>());
  final feedBackCon = TextEditingController();

  void _showTooltip(int index) {
    final dynamic tooltip = _tooltipKeys[index].currentState;
    tooltip.ensureTooltipVisible();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showTooltip(ratingValue);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 2,
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
                            text: "432",
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
                              title: 'Shivam Kumar',
                              maxLines: 1,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            TextConst(
                              title: '9645125486',
                              maxLines: 1,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            TextConst(
                              title: 'Basic Life Support',
                              maxLines: 1,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            TextConst(
                              title: '250 km',
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              Assets.iconsLocatinIcon,
                              height: 20,
                              width: 20,
                            )
                          ],
                        ),
                      ),
                      AppConstant.spaceWidth15,
                      SizedBox(
                        height: screenHeight * 0.07,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextConst(
                              title: 'Line bazar, Purnea, Bihar',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.addressColor,
                              fontWeight: FontWeight.w400,
                            ),
                            TextConst(
                              title: 'PMCH, Patna, Bihar',
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
                            : "Mukesh Kumar",
                        textColor: index == 0
                            ? AppColor.textColor.withOpacity(0.4)
                            : AppColor.primaryColor,
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                      ButtonConst(
                        onTap: () {
                          // Navigator.pushNamed(context, RoutesName.verifyOtpScreen);
                        },
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
                  if(index==0)
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
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LinearProgressIndicator(
                            value: 0.5, // Set progress value here
                            color: AppColor.primaryColor,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
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
                  if(index>0)
                  AppConstant.spaceHeight20,
                  if(index>0)
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
                  if(index>0)
                  AppConstant.spaceHeight20,
                  if(index>0)
                  TextConst(
                    title: '• Rate your experience',
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  if(index>0)
                  AppConstant.spaceHeight5,
                  if(index>0)
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (i) {
                          return Tooltip(
                            verticalOffset: -50,
                            key: _tooltipKeys[i],
                            message: ratingOption[i],
                            child: InkWell(
                                onTap: () {
                                  _showTooltip(i);
                                  setState(() {
                                    ratingValue = i;
                                  });
                                },
                                child: Icon(
                                  Icons.star_rounded,
                                  color:ratingValue >= i
                                      ? AppColor.greenColor:AppColor.greyColor,
                                  size: 30,
                                )),
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextConst(title: "Submit",color: AppColor.primaryColor,fontSize: AppConstant.fontSizeOne,fontWeight: FontWeight.bold,),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );

          index == 0
              ? Container(
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
                        Container(
                          width: screenWidth,
                          height: screenHeight * 0.4,
                          color: AppColor.whiteColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.clear,
                                      color: AppColor.blackColor)),
                              AppConstant.spaceHeight50,
                              Image.asset(
                                Assets.imageSorryBg,
                                scale: 4.6,
                              ),
                              TextConst(
                                title: 'Sorry !',
                                fontSize: AppConstant.fontSizeHeading,
                                color: AppColor.blackColor.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                              AppConstant.spaceHeight10,
                              TextConst(
                                title: 'Ambulance not found, please try again.',
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
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
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "Order Id : ",
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeOne),
                              CustomTextSpan(
                                  text: "432",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextConst(
                                    title: 'Name',
                                    fontSize: AppConstant.fontSizeTwo,
                                    color: AppColor.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextConst(
                                    title: 'Phone',
                                    fontSize: AppConstant.fontSizeTwo,
                                    color: AppColor.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextConst(
                                    title: 'Type',
                                    fontSize: AppConstant.fontSizeTwo,
                                    color: AppColor.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextConst(
                                    title: 'Distance',
                                    fontSize: AppConstant.fontSizeTwo,
                                    color: AppColor.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                            AppConstant.spaceWidth10,
                            SizedBox(
                              height: screenHeight * 0.12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                            AppConstant.spaceWidth10,
                            SizedBox(
                              height: screenHeight * 0.12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextConst(
                                    title: 'Shivam Kumar',
                                    maxLines: 1,
                                    fontSize: AppConstant.fontSizeTwo,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextConst(
                                    title: '9645125486',
                                    maxLines: 1,
                                    fontSize: AppConstant.fontSizeTwo,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextConst(
                                    title: 'Basic Life Support',
                                    maxLines: 1,
                                    fontSize: AppConstant.fontSizeTwo,
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextConst(
                                    title: '250 km',
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
                        TextConst(
                          title:
                              '--------------------------------------------------------------',
                          fontSize: AppConstant.fontSizeZero,
                          color: AppColor.textColor.withOpacity(0.3),
                          fontWeight: FontWeight.w500,
                        ),
                        AppConstant.spaceHeight10,
                        Row(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.07,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.blackColor)),
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
                                    Assets.iconsLocatinIcon,
                                    scale: 3,
                                  )
                                ],
                              ),
                            ),
                            AppConstant.spaceWidth5,
                            SizedBox(
                              height: screenHeight * 0.07,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextConst(
                                    title: 'Line bazar, Purnea, Bihar',
                                    fontSize: AppConstant.fontSizeOne,
                                    color: AppColor.addressColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextConst(
                                    title: 'PMCH, Patna, Bihar',
                                    fontSize: AppConstant.fontSizeOne,
                                    color: AppColor.greenColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        AppConstant.spaceHeight10,
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
                                  color:
                                      AppColor.primaryColor.withOpacity(0.6)),
                              label: "Mukesh Kumar",
                              textColor: AppColor.primaryColor,
                              fontSize: AppConstant.fontSizeOne,
                            ),
                            ButtonConst(
                              onTap: () {
                                // Navigator.pushNamed(context, RoutesName.verifyOtpScreen);
                              },
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.041,
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.blueColor,
                              border: Border.all(
                                  width: 1,
                                  color:
                                      AppColor.primaryColor.withOpacity(0.6)),
                              fontSize: AppConstant.fontSizeOne,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    Assets.iconsGreenCallIcon,
                                    color: AppColor.whiteColor,
                                    scale: 3,
                                  ),
                                  TextConst(
                                    title: 'Call to driver',
                                    fontSize: AppConstant.fontSizeOne,
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        AppConstant.spaceHeight20,
                        CustomRichText(textSpans: [
                          CustomTextSpan(
                              text: "Status : ",
                              fontWeight: FontWeight.w500,
                              textColor: AppColor.blackColor,
                              fontSize: AppConstant.fontSizeTwo),
                          CustomTextSpan(
                              text: "journey completed",
                              fontWeight: FontWeight.w500,
                              textColor: AppColor.primaryColor,
                              fontSize: AppConstant.fontSizeTwo)
                        ]),
                        AppConstant.spaceHeight10,
                        TextConst(
                          title: '●  Rate your experience',
                          fontSize: AppConstant.fontSizeOne,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                        AppConstant.spaceHeight10,
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(starList.length, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index == starList.length - 1
                                      ? AppColor.greyColor
                                      : AppColor.greenColor,
                                  size: 30,
                                );
                              }),
                            ),
                            AppConstant.spaceWidth5,
                            TextConst(
                              title: 'Submit',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blueColor,
                              fontWeight: FontWeight.w600,
                            ),
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
