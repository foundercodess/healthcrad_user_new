import 'package:flutter/material.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';

class PaymentModeWidget extends StatelessWidget {
  final String title;
  final int index;
  const PaymentModeWidget({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color:index==0? AppColor.primaryColor:AppColor.greyColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Row(
          children: [
            Container(
              height: 18,
              width: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      index == 0 ? AppColor.primaryColor : Colors.transparent,
                  border: Border.all(
                      color: index != 0
                          ? AppColor.greyColor
                          : Colors.transparent)),
              child: index == 0
                  ? Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.whiteColor,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            AppConstant.spaceWidth10,
            TextConst(
              title: title,
              fontSize: AppConstant.fontSizeTwo,
              color: AppColor.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
