import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_constant.dart';

import '../../generated/assets.dart';
import '../../main.dart';
import '../../res/app_color.dart';
import '../../res/custom_rich_text.dart';
import '../../res/text_const.dart';

class PrescriptionOrderHistoryDetailsScreen extends StatefulWidget {
  const PrescriptionOrderHistoryDetailsScreen({super.key});

  @override
  State<PrescriptionOrderHistoryDetailsScreen> createState() =>
      _PrescriptionOrderHistoryDetailsScreenState();
}

class _PrescriptionOrderHistoryDetailsScreenState
    extends State<PrescriptionOrderHistoryDetailsScreen> {
  int _currentStep = 2;
  final List<String> _steps = [
    'Order placed',
    'Accepted',
    'Pickup',
    'Shipped',
    'Delivered'
  ];

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: AppColor.whiteColor,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TextConst(
                              title: "Order Id: ",
                              color: AppColor.blackColor,
                              fontSize: AppConstant.fontSizeOne,
                            ),
                            TextConst(
                              title: "465",
                              color: AppColor.textColor,
                              fontSize: AppConstant.fontSizeOne,
                            ),
                          ],
                        ),
                        ButtonConst(
                          color: AppColor.buttonBlueColor,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          width: screenWidth / 3.5,
                          borderRadius: BorderRadius.circular(5),
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextConst(
                                title: "E-Receipt",
                                fontSize: AppConstant.fontSizeOne * 1.1,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w600,
                              ),
                              Icon(
                                Icons.download_for_offline_rounded,
                                size: 20,
                                color: AppColor.whiteColor,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    AppConstant.spaceHeight15,
                  orderTracking(),
                  ]),
            ),
            AppConstant.spaceHeight10,
            prescriptionOrderInfo(),
            AppConstant.spaceHeight10,
            shippingDetails(),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              alignment: Alignment.centerLeft,
              child: CustomRichText(textSpans: [
                CustomTextSpan(
                    text: "•  Cash on delivery : ",
                    textColor: AppColor.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: AppConstant.fontSizeOne),
                CustomTextSpan(
                  text: " ₹ 400",
                  fontWeight: FontWeight.w600,
                  textColor: AppColor.textColor,
                  fontSize: AppConstant.fontSizeOne,
                )
              ]),
            ),
            AppConstant.spaceHeight10,
            ratingOptionUI(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBarWidget(){
    return  AppBar(
      centerTitle: false,
      backgroundColor: AppColor.whiteColor,
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
                color: AppColor.blackColor,
                scale: 3,
              ),
            ),
            AppConstant.spaceWidth10,
           TextConst(title: "Prescription Order Details",fontWeight: FontWeight.w500,fontSize: AppConstant.fontSizeThree,),

          ],
        ),
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(Assets.imageCartOutline),
            Positioned(
              top: -15,
              right: -5,
              child: Container(
                alignment: Alignment.center,
                height: screenHeight * 0.04,
                width: screenWidth * 0.04,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.redColor,
                ),
                child: TextConst(
                  title: '3',
                  fontSize: AppConstant.fontSizeOne,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ],
        ),
        AppConstant.spaceWidth15,
      ],
    );
  }

  Widget orderTracking() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextConst(
          title: "Order Status",
          fontSize: AppConstant.fontSizeTwo,
        ),
        AppConstant.spaceHeight15,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextConst(
              textAlign: TextAlign.center,
              title: _steps[_currentStep],
              fontSize: AppConstant.fontSizeThree,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        AppConstant.spaceHeight15,
        SizedBox(
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < _steps.length; i++) ...[
                _buildStep(i, _steps[i]),
              ]
            ],
          ),
        ),
        AppConstant.spaceHeight20,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonConst(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: screenWidth / 2.5,
              borderRadius: BorderRadius.circular(5),
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextConst(
                    title: "See all updates",
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.buttonBlueColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      Assets.iconsArrowBack,
                      color: AppColor.buttonBlueColor,
                      scale: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget prescriptionOrderInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: screenWidth,
        height: screenWidth/1.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.primaryColor,width: 0.5),
          color: AppColor.whiteColor,
          image: const DecorationImage(
            image: AssetImage(Assets.imagePrecriptionOrderInfo)
          )
        ),
      ),
    );
  }

  Widget priceDetails() {
    return Container(
      width: screenWidth,
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextConst(
              title: 'Price Details',
              fontSize: AppConstant.fontSizeTwo,
              color: AppColor.blackColor,
              fontWeight: FontWeight.w600,
            ),
            AppConstant.spaceHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextConst(
                      title: 'Item Cost',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    AppConstant.spaceHeight5,
                    TextConst(
                      title: 'Discount',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    AppConstant.spaceHeight5,
                    TextConst(
                      title: 'Green Packaging',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    AppConstant.spaceHeight5,
                    TextConst(
                      title: 'Delivery Charge',
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
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w400,
                    ),
                    AppConstant.spaceHeight5,
                    TextConst(
                      title: '-₹ 500',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.greenColor,
                      fontWeight: FontWeight.w400,
                    ),
                    AppConstant.spaceHeight5,
                    CustomRichText(textSpans: [
                      CustomTextSpan(
                          text: "₹ 20 ",
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w400,
                          textColor: AppColor.textColor,
                          fontSize: AppConstant.fontSizeOne),
                      CustomTextSpan(
                          text: " ₹ 10",
                          fontWeight: FontWeight.w400,
                          textColor: AppColor.blackColor,
                          fontSize: AppConstant.fontSizeOne)
                    ]),
                    AppConstant.spaceHeight5,
                    CustomRichText(textSpans: [
                      CustomTextSpan(
                          text: "₹ 65 ",
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w400,
                          textColor: AppColor.textColor,
                          fontSize: AppConstant.fontSizeOne),
                      CustomTextSpan(
                          text: " ₹ 40",
                          fontWeight: FontWeight.w400,
                          textColor: AppColor.blackColor,
                          fontSize: AppConstant.fontSizeOne)
                    ]),
                  ],
                ),
              ],
            ),
            Divider(
              color: AppColor.scaffoldBgColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConst(
                  title: 'Total Cost',
                  fontSize: AppConstant.fontSizeOne,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w600,
                ),
                TextConst(
                  title: '₹ 550',
                  fontSize: AppConstant.fontSizeOne,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            AppConstant.spaceHeight5,
            CustomRichText(textSpans: [
              CustomTextSpan(
                  text: "You will save",
                  textColor: AppColor.greenColor,
                  fontSize: AppConstant.fontSizeTwo),
              CustomTextSpan(
                  text: " ₹ 105 ",
                  fontWeight: FontWeight.bold,
                  textColor: AppColor.greenColor,
                  fontSize: AppConstant.fontSizeThree),
              CustomTextSpan(
                  text: "on this order",
                  textColor: AppColor.greenColor,
                  fontSize: AppConstant.fontSizeTwo)
            ]),
          ],
        ),
      ),
    );
  }

  Widget shippingDetails() {
    return Container(
      width: screenWidth,
      color: AppColor.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextConst(
            title: "Shipping details",
            color: AppColor.textColor,
            fontSize: AppConstant.fontSizeOne,
          ),
          Divider(
            color: AppColor.greyColor.withOpacity(0.3),
          ),
          AppConstant.spaceHeight5,
          TextConst(
            title: "Om Shankar Sharma",
            color: AppColor.blackColor,
            fontSize: AppConstant.fontSizeTwo,
            fontWeight: FontWeight.w600,
          ),
          AppConstant.spaceHeight5,
          TextConst(
            title: "Sharda nagar (Banti Kirana Store), Bus Stand Purnea 485695",
            color: AppColor.textColor,
            fontSize: AppConstant.fontSizeOne,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget ratingOptionUI(){
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      color: AppColor.whiteColor,
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextConst(
            title: '•  Rate your experience',
            fontSize: AppConstant.fontSizeOne,
            color: AppColor.blackColor,
            fontWeight: FontWeight.w400,
          ),
          AppConstant.spaceHeight15,
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
                          color: ratingValue >= i
                              ? AppColor.greenColor
                              : AppColor.greyColor,
                          size: 30,
                        )),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextConst(
                  title: "Submit",
                  color: AppColor.primaryColor,
                  fontSize: AppConstant.fontSizeOne,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          AppConstant.spaceHeight20,
        ],
      ),
    );
  }

  Widget _buildStep(int step, String label, ) {
    bool isActive = step <= _currentStep;
    bool lineActive= _currentStep >= step;
    return SizedBox(
      width: screenWidth/5.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 2,
                width: screenWidth/15.3,
                color:step==0? Colors.transparent :lineActive ? const Color(0xff0488A4) : Colors.grey,
              ),
              Container(
                height: 20,width: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyColor, width: isActive?0:2),
                  shape: BoxShape.circle,
                  color: isActive ? const Color(0xff0488A4) : Colors.white,
                ),
                child: isActive
                    ? const Icon(Icons.check, color: Colors.white, size: 15,)
                    : const Icon(Icons.circle, color: Colors.grey, size: 15,),
              ),
              Container(
                height: 2,
                width: screenWidth/15.3,
                color:step>3? Colors.transparent :lineActive ? const Color(0xff0488A4) : Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextConst(title:label, fontSize: AppConstant.fontSizeZero,color: step<3?const Color(0xff0488A4):AppColor.blackColor,),
        ],
      ),
    );
  }

}
