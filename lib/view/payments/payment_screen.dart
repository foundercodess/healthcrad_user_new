import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view/payments/widget/payment_mode_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      bottomNavigationBar: Container(
        height: screenHeight * 0.15,
        color: AppColor.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              Assets.iconsSafeIcon,
              scale: 4,
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextConst(
                    title: '₹ 550',
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.commonOrderScreen, arguments: {"name":"Your order has been successfully\nplaced"});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.buttonBlueColor,
                      ),
                      child: TextConst(
                        title: 'Place Order',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            Assets.iconsArrowBack,
            color: AppColor.whiteColor,
            scale: 3,
          ),
        ),
        title: TextConst(
          title: 'Payment',
          fontSize: AppConstant.fontSizeThree,
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Container(
              height: screenHeight * 0.038,
              width: screenWidth * 0.28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.whiteColor,
                  image: const DecorationImage(
                      image: AssetImage(Assets.iconsPSecureIcons),
                      fit: BoxFit.fill)),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(screenHeight * 0.1), // Specify the height
          child: Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            color: AppColor.whiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth/1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "Deliver to: ",
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeOne),
                              CustomTextSpan(
                                  text: "Om Shankar Sh... , 848125",
                                  textColor: AppColor.blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppConstant.fontSizeOne)
                            ]),
                            AppConstant.spaceHeight5,
                            TextConst(
                              title: 'Sharda Nagar (Banti Kirana Store), Purn..',
                              fontSize: AppConstant.fontSizeOne,
                              color: AppColor.textColor,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: screenHeight * 0.04,
                        width: screenWidth/5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 1,
                                color: AppColor.primaryColor.withOpacity(0.4))),
                        child: TextConst(
                          title: 'Change',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextConst(
                      title: 'Price Details',
                      fontSize: AppConstant.fontSizeTwo,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    AppConstant.spaceHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextConst(
                          title: 'Item Cost',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        TextConst(
                          title: '₹ 500',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextConst(
                          title: 'Discount',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        TextConst(
                          title: '-₹ 500',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.greenColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextConst(
                          title: 'Green Packaging',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomRichText(textSpans: [
                          CustomTextSpan(
                            text: "₹ 20 ",
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeTwo,
                          ),
                          CustomTextSpan(
                            text: " ₹ 10",
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.blackColor,
                            fontSize: AppConstant.fontSizeTwo,
                          ),
                        ]),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextConst(
                          title: 'Delivery Charge',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomRichText(textSpans: [
                          CustomTextSpan(
                            text: "₹ 65 ",
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeTwo,
                          ),
                          CustomTextSpan(
                            text: " ₹ 40",
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.blackColor,
                            fontSize: AppConstant.fontSizeTwo,
                          ),
                        ]),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextConst(
                              title: 'Coupon Discount',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.greenColor,
                              fontWeight: FontWeight.w400,
                            ),
                            Image.asset(
                              Assets.iconsDiscountIcon,
                              scale: 1.9,
                            ),
                          ],
                        ),
                        TextConst(
                          title: '₹ 25 ',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.greenColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Divider(),
                    ),
                    AppConstant.spaceHeight5,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColor.searchFieldBgColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextConst(
                            title: 'Total Cost',
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.buttonBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                          TextConst(
                            title: '₹ 550',
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.buttonBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    AppConstant.spaceHeight10,
                    CustomRichText(textSpans: [
                      CustomTextSpan(
                        text: "You will save",
                        textColor: AppColor.greenColor,
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                      CustomTextSpan(
                        text: " ₹ 105 ",
                        fontWeight: FontWeight.bold,
                        textColor: AppColor.greenColor,
                        fontSize: AppConstant.fontSizeThree,
                      ),
                      CustomTextSpan(
                        text: "on this order",
                        textColor: AppColor.greenColor,
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                    ]),
                  ],
                ),
              ),
            ),

            AppConstant.spaceHeight10,
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.applyCouponPage);
              },
              child: Container(
                color: AppColor.whiteColor,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  leading: Image.asset(Assets.gifCouponGif),
                  title: TextConst(
                    textAlign:TextAlign.start,
                    title: 'Apply Coupon',
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.blackColor,

                  ),
                  trailing: Image.asset(
                    Assets.iconsIconsArrowRight,
                    scale: 3,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextConst(
                          title: 'Coupon Applied',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.greenColor,
                        ),
                        AppConstant.spaceWidth10,
                        Container(
                          height: 18,
                          width: 18,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(Assets.iconsGreenCheckIcons))),
                        ),
                      ],
                    ),
                    TextConst(
                      title: 'REMOVE',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.redColor,
                    ),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.iconsPaymentIcon,
                          width: 25,
                        ),
                        AppConstant.spaceWidth10,
                        TextConst(
                          title: 'Payment Mode',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    AppConstant.spaceHeight15,
                    const PaymentModeWidget(
                      index: 0,
                      title: "Cash on Delivery",
                    ),
                    const PaymentModeWidget(
                      index: 1,
                      title: "Online Payment",
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
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.iconsCartIcons,
                          scale: 1.9,
                        ),
                        AppConstant.spaceWidth15,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "Cancellation ",
                                  textColor: AppColor.redColor,
                                  fontSize: AppConstant.fontSizeZero),
                              CustomTextSpan(
                                  text:
                                      'is allowed as long as the product is not pickup.',
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeZero)
                            ]),
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "Cancellation ",
                                  textColor: AppColor.redColor,
                                  fontSize: AppConstant.fontSizeZero),
                              CustomTextSpan(
                                  text:
                                      'will not be allowed after the product is pickup.',
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeZero)
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10
          ],
        ),
      ),
    );
  }
}


