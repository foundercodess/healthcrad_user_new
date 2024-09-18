import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

import 'text_const.dart';

class DealsListView extends StatefulWidget {
  const DealsListView({
    super.key,
  });

  @override
  State<DealsListView> createState() => DealsListViewState();
}

class DealsListViewState extends State<DealsListView> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return  DealsMedicine(index: index,);
      },
    );
  }
}

class DealsMedicine extends StatelessWidget {
  final int index;
  const DealsMedicine({
    super.key,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:index==-1? 0:15, right:index==2?15:0 ),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, RoutesName.medicineDetails);
        },
        child: Container(
          width: screenWidth * 0.37,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.whiteColor,
              border: Border.all(
                  width: 1, color:const Color(0xffAFD9FF))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.2,
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: AppColor.darkGreenColor,
                  ),
                  child: TextConst(
                    title: '55.5 % OFF',
                    fontWeight: FontWeight.w600,
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.whiteColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10, vertical: 7),
                          child: Container(
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.22,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Assets.imageTablelBg),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                          TextConst(
                            textAlign: TextAlign.left,
                            title: 'Dulcoflex Tablet',
                            fontSize: AppConstant.fontSizeOne,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor,
                          ),
                        ],
                      ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      int.parse((screenWidth / 20).toStringAsFixed(0)),
                          (i) => TextConst(
                        title: '-',
                        fontSize: AppConstant.fontSizeZero,
                        color: AppColor.greyColor.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRichText(textSpans: [
                            CustomTextSpan(
                                text: "Rs. ",
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
                          CustomRichText(textSpans: [
                            CustomTextSpan(
                                text: "Rs. ",
                                fontWeight: FontWeight.normal,
                                textColor: AppColor.blackColor.withOpacity(0.9),
                                fontSize: AppConstant.fontSizeTwo),
                            CustomTextSpan(
                                text: "216",
                                fontWeight: FontWeight.bold,
                                textColor: AppColor.blackColor,
                                fontSize: AppConstant.fontSizeTwo)
                          ]),
                        ],
                      ),
                      Image.asset(
                        Assets.imageRxBg,
                        width:15,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ButtonConst(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: screenHeight * 0.04,
                    onTap: () {},
                    color: AppColor.buttonBlueColor,
                    label: 'Add'.toUpperCase(),
                    textColor: AppColor.whiteColor,
                    fontSize: AppConstant.fontSizeTwo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

