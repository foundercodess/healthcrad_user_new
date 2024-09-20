import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

import '../../generated/assets.dart';
import '../../res/app_color.dart';

class MedicineOrderHistoryScreen extends StatefulWidget {
  const MedicineOrderHistoryScreen({super.key});

  @override
  State<MedicineOrderHistoryScreen> createState() =>
      _MedicineOrderHistoryScreenState();
}

class _MedicineOrderHistoryScreenState
    extends State<MedicineOrderHistoryScreen> {
  final gradientColorOrange = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xffFFCDA0), Color(0xffFFDDBE), Color(0xffFFFFFF)]);
  final gradientColorBlue = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xffCBE6FF), Color(0xffD7ECFF), Color(0xffFFFFFF)]);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          toolbarHeight: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight * 2.9),
            child: appBarWithTab(),
          ),
        ),
        body: selectedIndex == 0 ? myOrderList() : prescriptionOrderList());
  }

  Widget appBarWithTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          width: screenWidth,
          decoration: BoxDecoration(
              gradient:
                  selectedIndex == 0 ? gradientColorBlue : gradientColorOrange),
          child: Column(
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
                      color: AppColor.blackColor,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  AppConstant.spaceWidth10,
                  TextConst(title: "My Orders",fontSize: AppConstant.fontSizeThree,),
                  const Spacer(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(Assets.imageCartOutline,  height: 25,
                        width: 25,),
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
                ],
              ),
              AppConstant.spaceHeight25,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  tabButton("My order", Assets.iconsDelivery, 0),
                  tabButton("Prescription order", Assets.iconsRxVector, 1),
                ],
              )
            ],
          ),
        ),
        AppConstant.spaceHeight20,
        ButtonConst(
          color: Colors.transparent,
          margin: const EdgeInsets.only(right: 15),
          width: 80,
          height: 30,
          icon: Icons.filter_list_alt,
          label: "Filter",
          iconColor: AppColor.blackColor,
        )
      ],
    );
  }

  Widget tabButton(String title, String image, int index) {
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: ButtonConst(
        color: isSelected ? AppColor.buttonBlueColor : AppColor.whiteColor,
        width: screenWidth / 2.3,
        height: 40,
        borderRadius: BorderRadius.circular(5),
        border:
            Border.all(color: AppColor.textColor.withOpacity(0.5), width: 0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              color: isSelected ? Colors.yellow : Colors.orange,
              height: 25,
              width: 25,
            ),
            AppConstant.spaceWidth10,
            TextConst(
              title: title,
              fontSize: AppConstant.fontSizeTwo / 1.1,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColor.whiteColor : AppColor.blackColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget prescriptionOrderList() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (_, int i) {
          return InkWell(
            onTap: (){
               Navigator.pushNamed(context, RoutesName.prescriptionOrderHistoryDetailsScreen);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.3, color: AppColor.greyColor))),
              child: Row(
                children: [
                  Image.asset(
                    Assets.imageTablelBg,
                    width: screenWidth / 6,
                  ),
                  AppConstant.spaceWidth10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderStatus(i),
                      AppConstant.spaceHeight5,
                      TextConst(
                        title: "MyPees.png",
                        color: AppColor.textColor,
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                      AppConstant.spaceHeight5,
                      TextConst(
                        title: "29 sept, 2024",
                        color: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.navigate_next_rounded,
                    size: 35,
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget myOrderList() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        itemCount: 13,
        itemBuilder: (_, int i) {
          return InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.medicineOrderHistoryDetailScreen);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.3, color: AppColor.greyColor))),
              child: Row(
                children: [
                  Image.asset(
                    Assets.imageTablelBg,
                    width: screenWidth / 6,
                  ),
                  AppConstant.spaceWidth10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderStatus(i),
                      AppConstant.spaceHeight5,
                      TextConst(
                        title: "6 items (Medicine)",
                        color: AppColor.textColor,
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                      AppConstant.spaceHeight5,
                      TextConst(
                        title: "29 sept, 2024",
                        color: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.navigate_next_rounded,
                    size: 35,
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget orderStatus(int index) {
    switch (index) {
      case 1:
        return TextConst(
          title: "Order Shipped",
          color: AppColor.greenColor,
          fontSize: AppConstant.fontSizeTwo,
        );
      case 2:
        return Row(
          children: [
            TextConst(
              title: "Cancelled",
              color: AppColor.redColor,
              fontSize: AppConstant.fontSizeTwo,
            ),
            AppConstant.spaceWidth5,
            TextConst(
              title: "on 24 sept 2024",
              color: AppColor.blackColor,
              fontSize: AppConstant.fontSizeTwo,
            ),
          ],
        );
      case 3:
        return Row(
          children: [
            TextConst(
              title: "Order Delivered",
              color: AppColor.greenColor,
              fontSize: AppConstant.fontSizeTwo,
            ),
            AppConstant.spaceWidth5,
            TextConst(
              title: "on 26 sept 2024",
              color: AppColor.blackColor,
              fontSize: AppConstant.fontSizeTwo,
            ),
          ],
        );
      default:
        return TextConst(
          title: "Order waiting",
          color: AppColor.greenColor,
          fontSize: AppConstant.fontSizeTwo,
        );
    }
  }
}
