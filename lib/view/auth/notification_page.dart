import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';

import 'package:health_crad_user/res/text_const.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

int selectedRemoveBtn = -1;

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
        appBar: AppBar(
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
                TextConst(
                  title: 'Notificator Center',
                  fontSize: AppConstant.fontSizeThree,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 6,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedRemoveBtn=-1;
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: index == 0 ? 10 : 0, bottom: 10),
                width: screenWidth,
                color: AppColor.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/image/notification_logo.png',
                            scale: 2,
                          ),
                          // CustomRichText(textSpans: [
                          //   CustomTextSpan(
                          //       text: "Health",
                          //       textColor: AppColor.blueColor,
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: AppConstant.fontSizeThree),
                          //   CustomTextSpan(
                          //       text: "CRAD",
                          //       fontWeight: FontWeight.w600,
                          //       textColor: AppColor.primaryColor,
                          //       fontSize: AppConstant.fontSizeThree)
                          // ]),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.more_horiz_outlined,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                selectedRemoveBtn = index;
                              });
                            },
                          )
                        ],
                      ),
                      selectedRemoveBtn == index
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: screenHeight * 0.04,
                                width: screenWidth * 0.3,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1, color: AppColor.redColor)),
                                child: TextConst(
                                  title: 'Remove',
                                  fontSize: AppConstant.fontSizeTwo,
                                  color: AppColor.redColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : Container(),
                      AppConstant.spaceHeight5,
                      TextConst(
                        title: 'Order Id: 432',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                      AppConstant.spaceHeight5,
                      TextConst(
                        textAlign: TextAlign.start,
                        title:
                            "Your order has been shipped today 20 Aug. It’s takes 3-4 days to deliver your product to your address.",
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      AppConstant.spaceHeight10,
                      TextConst(
                        textAlign: TextAlign.start,
                        title: "Please check your order status.",
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.greenColor,
                      ),
                      AppConstant.spaceHeight5,
                      Container(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextConst(
                          textAlign: TextAlign.end,
                          title: "1 day ago",
                          fontSize: AppConstant.fontSizeOne,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
