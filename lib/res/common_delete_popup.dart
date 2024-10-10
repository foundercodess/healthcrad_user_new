import 'package:flutter/material.dart';

import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';

import '../../../main.dart';

class CommonDeletePopup extends StatelessWidget {
  final String title;
  final VoidCallback yes;

  const CommonDeletePopup({
    super.key,
    required this.title,
    required this.yes,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 3,
        insetPadding: const EdgeInsets.symmetric(horizontal: 25),
        backgroundColor: Colors.transparent,
        // contentPadding: const EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.whiteColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textWidget(
                  text: title,
                  fontWeight: FontWeight.w600,
                  fontSize: AppConstant.fontSizeThree,
                  color: AppColor.blackColor,
                  textAlign: TextAlign.center),
              AppConstant.spaceHeight25,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: yes,
                    child: Container(
                      alignment: Alignment.center,
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.buttonBlueColor,
                      ),
                      child: TextConst(
                        title: 'Yes',
                        fontSize: AppConstant.fontSizeOne,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.redColor,
                      ),
                      child: TextConst(
                        title: 'No',
                        fontSize: AppConstant.fontSizeOne,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

Widget textWidget({
  required String text,
  double? fontSize,
  String? fontFamily,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.white,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      fontFamily: fontFamily ?? "Poppins_Regular",
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
