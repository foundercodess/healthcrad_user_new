import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/details_slider.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key});

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      bottomNavigationBar: Container(
        height: screenHeight / 14,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            color: AppColor.primaryColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConst(
                        title: 'Quantity: 2',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.whiteColor,
                      ),
                      TextConst(
                        title: 'Rs. 5,126',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.cartPage);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.whiteColor,
                      ),
                      child: TextConst(
                        title: 'Add to cart',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
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
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  child: SvgPicture.asset(
                    Assets.iconsSearchIcons,
                    height:10,
                    width: 10,

                  ),
                ),
                hint: "Find medicine...",
                fontSize: AppConstant.fontSizeTwo,
                sufixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  child: SvgPicture.asset(
                    Assets.iconsMicIcons,
                    color: AppColor.blueColor,
                    height: 10,
                    width: 10,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ImageIcon(
                  const AssetImage(Assets.iconsCartIcons),
                  size: screenWidth * 0.08,
                  color: AppColor.whiteColor,
                ),
                Positioned(
                  left: screenHeight * 0.023,
                  bottom: screenHeight * 0.01,
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppConstant.spaceHeight10,
            Container(
              height: screenHeight / 3.5,
              width: screenWidth,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(
                    Assets.imageTablelBg,
                    height: screenWidth / 2.5,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: 60,
                        height: screenHeight / 3.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              Assets.imageRxBg,
                              width: 20,
                            ),
                            SvgPicture.asset(
                              Assets.iconsShareIconsS,
                              color: AppColor.whiteColor,
                              height: 10,
                              width: 10,
                            ),
                            // Image.asset(
                            //   Assets.iconsShareIcon,
                            //   color: AppColor.greyColor,
                            //   width: 20,
                            // ),
                          ],
                        ),
                      )
                    ],
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
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextConst(
                      title: 'Dulcoflex Tablet 10’S',
                      fontSize: AppConstant.fontSizeThree,
                      color: AppColor.blackColor,
                    ),
                    AppConstant.spaceHeight5,
                    Row(children: [
                      CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "Rs.",
                            fontWeight: FontWeight.normal,
                            textColor: AppColor.textColor.withOpacity(0.9),
                            fontSize: AppConstant.fontSizeOne),
                        CustomTextSpan(
                            text: "270",
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.normal,
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeOne)
                      ]),
                      AppConstant.spaceWidth10,
                      CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "25.03 % off",
                            fontWeight: FontWeight.normal,
                            textColor: AppColor.greenColor,
                            fontSize: AppConstant.fontSizeOne)
                      ]),
                    ]),
                    CustomRichText(textSpans: [
                      CustomTextSpan(
                          text: "Rs. ",
                          fontWeight: FontWeight.normal,
                          textColor: AppColor.primaryColor,
                          fontSize: AppConstant.fontSizeTwo),
                      CustomTextSpan(
                          text: "216",
                          fontWeight: FontWeight.w600,
                          textColor: AppColor.primaryColor,
                          fontSize: AppConstant.fontSizeTwo)
                    ]),
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
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextConst(
                      title: 'Select Quantity :',
                      fontSize: AppConstant.fontSizeThree,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.iconsMinusIcon),
                                  fit: BoxFit.fill)),
                        ),
                        AppConstant.spaceWidth20,
                        TextConst(
                          title: '2',
                          fontSize: AppConstant.fontSizeThree,
                          color: AppColor.blackColor,
                        ),
                        AppConstant.spaceWidth20,
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(Assets.iconsPlusIcon),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: DetailsSlider(),
            ),
            AppConstant.spaceHeight10,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: TextConst(
                      title: 'Product Introduction',
                      fontSize: AppConstant.fontSizeThree,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  AppConstant.spaceHeight15,
                  TextConst(
                    title: 'Prescription Required *',
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.blackColor,
                  ),
                  AppConstant.spaceHeight10,
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "MARKETER: ",
                        textColor: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeOne),
                    CustomTextSpan(
                        text: "Merck Ltd",
                        textColor: AppColor.textColor,
                        fontSize: AppConstant.fontSizeOne),
                  ]),
                  AppConstant.spaceHeight10,
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "SALT COMPOSITION: ",
                        textColor: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeOne),
                    CustomTextSpan(
                        text: "Bisoprolol (5mg) + \nHydrochlorothiazide (12.5mg)",
                        textColor: AppColor.textColor,
                        fontSize: AppConstant.fontSizeOne),
                  ]),
                  AppConstant.spaceHeight10,
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "STORAGE: ",
                        textColor: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeOne),
                    CustomTextSpan(
                        text: "Store below 30°C",
                        textColor: AppColor.textColor,
                        fontSize: AppConstant.fontSizeOne),
                  ]),
                  AppConstant.spaceHeight10,
                  TextConst(
                    textAlign: TextAlign.start,
                    title:
                        'Concor Plus Tablet is a combination of two \nmedicines used to treat hypertension',
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.textColor,
                  ),
                  AppConstant.spaceHeight10,
                  TextConst(
                    textAlign: TextAlign.start,
                    title:
                        "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry. Lorem Ipsum has been the\nindustry's standard dummy text ever",
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.textColor,
                  ),
                ],
              ),
            ),
            AppConstant.spaceHeight10,
            medicineDisclaimer(),
            AppConstant.spaceHeight10,
          ],
        ),
      ),
    );
  }

  Widget medicineDisclaimer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: screenWidth,
      color: AppColor.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextConst(
            title: 'DISCLAIMER',
            fontSize: AppConstant.fontSizeThree,
            color: AppColor.blackColor,
          ),
          AppConstant.spaceHeight15,
          TextConst(
            textAlign: TextAlign.start,
            title:
                'The contents of this app are for informational purposes only and not intended to be a substitute for professional medical advice, diagnosis, or treatment. Please seek the advice of a physician or other qualified health provider with any questions you may have regarding a medical condition. Do not disregard professional medical advice or delay in seeking it because of something you have read on this app.',
            fontSize: AppConstant.fontSizeOne,
            color: AppColor.textColor,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
