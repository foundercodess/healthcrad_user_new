import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';

import 'text_const.dart';

class CartListView extends StatefulWidget {
  const CartListView({
    super.key,
  });

  @override
  State<CartListView> createState() => CartListViewState();
}

class CartListViewState extends State<CartListView> {
  List<CartModel> cartModelList = [
    // CartModel(title: 'Doctors', img: Assets.imageDoctorBg),
    // CartModel(title: 'Medicines', img: Assets.imageMedicinesBg),
    // CartModel(title: 'Ambulance', img: Assets.imageAmbulanceBg),
    // CartModel(title: 'Pathlab', img: Assets.imagePathlabBg),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          width: screenWidth,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: screenWidth/5,
                      width: screenWidth/5,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.imageTablelBg),
                              fit: BoxFit.contain)),
                    ),
                    SizedBox(
                      width: screenWidth/1.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextConst(
                            title: 'Dulcoflex Tablet 10s',
                            fontSize: AppConstant.fontSizeTwo,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor,
                          ),
                          AppConstant.spaceHeight5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomRichText(textSpans: [
                                        CustomTextSpan(
                                            text: "MRP: ",
                                            fontWeight: FontWeight.w500,
                                            textColor: AppColor.textColor,
                                            fontSize: AppConstant.fontSizeOne),
                                        CustomTextSpan(
                                            decoration: TextDecoration.lineThrough,
                                            text: "₹ 22.68",
                                            textColor: AppColor.textColor,
                                            fontSize: AppConstant.fontSizeOne,
                                            fontWeight: FontWeight.bold)
                                      ]),
                                      AppConstant.spaceWidth5,
                                      Container(
                                        height: 20,
                                        width: 1,
                                        color: AppColor.blackColor.withOpacity(0.6),
                                      ),
                                      AppConstant.spaceWidth5,
                                      CustomRichText(textSpans: [
                                        // CustomTextSpan(
                                        //     text: "OFF: ",
                                        //     fontWeight: FontWeight.w500,
                                        //     textColor: AppColor.textColor,
                                        //     fontSize: AppConstant.fontSizeOne),
                                        CustomTextSpan(
                                            text: "25.03 % off",
                                            textColor: AppColor.greenColor,
                                            fontSize: AppConstant.fontSizeOne,
                                            fontWeight: FontWeight.bold),
                                      ]),
                                    ],
                                  ),
                                  AppConstant.spaceHeight5,
                                  TextConst(
                                    title: '₹ 18.14',
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppConstant.fontSizeTwo,
                                    color: AppColor.blackColor,
                                  ),
                                ],
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                        AssetImage(Assets.iconsDeleteIcon),
                                        fit: BoxFit.fill)),
                              ),
                            ],
                          ),
                          AppConstant.spaceHeight5,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    Assets.iconsExpressIcons,
                    scale: 1.9,
                  ),
                  AppConstant.spaceWidth5,
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "Express ",
                        fontWeight: FontWeight.w600,
                        textColor: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeOne),
                    CustomTextSpan(
                        text: "Delivery within 3 to 4 days.",
                        textColor: AppColor.textColor,
                        fontSize: AppConstant.fontSizeOne,
                        fontWeight: FontWeight.w300),
                  ]),
                  const Spacer(),
                  SizedBox(
                    height: screenHeight * 0.04,
                    width: screenWidth /4.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(Assets.iconsBMinusIcons),
                                  fit: BoxFit.fill)),
                        ),
                        TextConst(
                          title: '2',
                          fontSize: AppConstant.fontSizeOne,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 25,
                          width:25,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(Assets.iconsBPlusIcons),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class CartModel {
  final String title;
  final String img;

  CartModel({
    required this.title,
    required this.img,
  });
}
