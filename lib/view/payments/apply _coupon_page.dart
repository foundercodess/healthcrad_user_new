import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';

import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/view_model/coupon_view_model.dart';
import 'package:provider/provider.dart';

class ApplyCouponPage extends StatefulWidget {
  const ApplyCouponPage({super.key});

  @override
  State<ApplyCouponPage> createState() => _ApplyCouponPageState();
}

class _ApplyCouponPageState extends State<ApplyCouponPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CouponViewModel>(context, listen: false).couponGetApi(context);
  }


  @override
  Widget build(BuildContext context) {
    final couponViewModel = Provider.of<CouponViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: couponViewModel.couponsModelData ==null?Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight / 5.5,
              width: screenWidth,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    Row(children: [
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
                      TextConst(
                        title: 'APPLY COUPON',
                        fontSize: AppConstant.fontSizeThree,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ]),
                    AppConstant.spaceHeight30,
                    TextFieldConst(
                      height: 45,
                      fillColor: AppColor.whiteColor,
                      keyboardType: TextInputType.text,
                      maxLength: 20,
                      filled: true,
                      sufixIcon: Container(
                        padding: const EdgeInsets.only(right: 15),
                        width: 70,
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: TextConst(
                            title: 'APPLY',
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      hint: "Enter Coupon Code",
                      fontSize: AppConstant.fontSizeTwo,
                      borderSide:
                          BorderSide(width: 0.5, color: AppColor.textColor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: screenHeight/1.2,
                child: couponData())
          ],
        ),
      ),
    );
  }

  Widget couponData(){
    final couponViewModel = Provider.of<CouponViewModel>(context);
    return  SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: TextConst(
              title: 'More offers',
              fontSize: AppConstant.fontSizeTwo,
              color: AppColor.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppConstant.spaceHeight10,
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: couponViewModel.couponsModelData!.couponsModelData!.length,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              return Container(
                width: screenWidth,
                height: screenHeight / 5,
                margin: const EdgeInsets.only(bottom: 20,),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(1, 1),
                          spreadRadius: 1,
                          blurRadius: 3)
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.whiteColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: screenHeight,
                      width: screenWidth * 0.13,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          color: AppColor.buttonBlueColor),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: TextConst(
                            title: 'FLAT ${couponViewModel.couponsModelData!.couponsModelData![index].discountPrice} OFF',
                            fontSize: AppConstant.fontSizeThree,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth / 1.3,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextConst(
                                title: couponViewModel.couponsModelData!.couponsModelData![index].couponCode,
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                              TextConst(
                                title: 'APPLY',
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          AppConstant.spaceHeight5,
                          TextConst(
                            title: 'Add Rs. ${couponViewModel.couponsModelData!.couponsModelData![index].minOrderPrice} to avail this offer',
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w400,
                          ),
                          AppConstant.spaceHeight5,
                          TextConst(
                            title: 'Get flat Rs. ${couponViewModel.couponsModelData!.couponsModelData![index].discountPrice} off',
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w400,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: screenWidth,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                int.parse((screenWidth / 12).toStringAsFixed(0)),
                                    (i) => TextConst(
                                  title: '-',
                                  fontSize: AppConstant.fontSizeZero,
                                  color: AppColor.textColor.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          TextConst(
                            textAlign: TextAlign.start,
                            title:
                            couponViewModel.couponsModelData?.couponsModelData![index].description,
                            fontSize: AppConstant.fontSizeOne,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                          AppConstant.spaceHeight5,
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextConst(
                              title: 'T&C Apply',
                              fontSize: AppConstant.fontSizeZero,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
