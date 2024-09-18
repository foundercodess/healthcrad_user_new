import 'package:flutter/material.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';

import '../../../main.dart';

class FilterPopup extends StatelessWidget {
  // final String title;
  // final VoidCallback yes;

  const FilterPopup({
    super.key,
    // required this.title,
    // required this.yes,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
            blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConst(
                  title: 'Filter by status',
                  fontSize: AppConstant.fontSizeThree,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.04,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: AppColor.textColor.withOpacity(0.2),
                      )),
                  child: TextConst(
                    title: 'Download',
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.textColor.withOpacity(0.2),
                  ),
                ),
                AppConstant.spaceWidth10,
                Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.04,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: AppColor.textColor.withOpacity(0.2),
                      )),
                  child: TextConst(
                    title: 'Cancelled',
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.textColor.withOpacity(0.2),
                  ),
                ),
              ],
            ),
            TextConst(
              title: 'Filter by date',
              fontSize: AppConstant.fontSizeThree,
              color: AppColor.blackColor,
              fontWeight: FontWeight.w500,
            ),
            AppConstant.spaceHeight10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonDatePopup(),
                CommonDatePopup(),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CommonDatePopup(),
                CommonDatePopup(),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                height: screenHeight * 0.05,
                width: screenWidth * 0.3,
                decoration: BoxDecoration(
                    color: AppColor.blueColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: AppColor.textColor.withOpacity(0.2),
                    )),
                child: TextConst(
                  title: 'Apply',
                  fontSize: AppConstant.fontSizeTwo,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonDatePopup extends StatelessWidget {
  const CommonDatePopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: screenHeight * 0.05,
      width: screenWidth * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: AppColor.textColor.withOpacity(0.2),
          )),
      child: TextConst(
        title: 'Cancelled',
        fontSize: AppConstant.fontSizeTwo,
        color: AppColor.textColor.withOpacity(0.2),
      ),
    );
  }
}
