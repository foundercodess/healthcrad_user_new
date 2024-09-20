import 'package:flutter/material.dart';

import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:intl/intl.dart';

import 'text_const.dart';

class AddressListView extends StatefulWidget {
  const AddressListView({
    super.key,
  });

  @override
  State<AddressListView> createState() => AddressListViewState();
}

class AddressListViewState extends State<AddressListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return SizedBox(
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15, vertical:15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primaryColor,
                      ),
                      child: Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    AppConstant.spaceWidth15,
                    Column(
                      children: [
                        TextConst(
                          textAlign: TextAlign.start,
                          title: 'Om Shankar Sharma',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                          fontWeight:FontWeight.w600,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.25,
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1, color: AppColor.rBorderSideColor)),
                      child: TextConst(
                        title: 'Change',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                AppConstant.spaceHeight15,
                Row(
                  children: [
                    AppConstant.spaceWidth25,
                    AppConstant.spaceWidth5,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.7,
                          child: TextConst(
                            textAlign: TextAlign.start,
                            title:
                                'Sharda Nagar (Banti Kirana Store), Bus Stand, Purnea 854301',
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        AppConstant.spaceHeight5,
                        TextConst(
                          fontWeight: FontWeight.w500,
                          title: '9939716846',
                          fontSize: AppConstant.fontSizeOne,
                          color: AppColor.blackColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
