import 'package:flutter/material.dart';

import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';

import '../../../main.dart';

class CommonFilterPopup extends StatelessWidget {
  final String title;


  const CommonFilterPopup({
    super.key,
    required this.title,

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
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                  text: title,
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstant.fontSizeThree,
                  color: AppColor.blackColor,
                  textAlign: TextAlign.center),
              AppConstant.spaceHeight10,
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(2, (index) {
              return  GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.3,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: AppColor.greyColor.withOpacity(0.7)),
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.whiteColor,
                          ),
                          child: TextConst(
                            title: 'Attended',
                            fontSize: AppConstant.fontSizeThree,
                            color: AppColor.textColor.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
            }),
          ),
              AppConstant.spaceHeight10,
              TextConst(
                title: 'Filter by date',
                fontSize: AppConstant.fontSizeThree,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w500,
              ),
              AppConstant.spaceHeight10,
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(4, (index) {
                  return  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: AppColor.greyColor.withOpacity(0.7)),
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.whiteColor,
                      ),
                      child: TextConst(
                        title: 'Attended',
                        fontSize: AppConstant.fontSizeThree,
                        color: AppColor.textColor.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }),
              ),

              AppConstant.spaceHeight25,
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.45,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: AppColor.greyColor.withOpacity(0.7)),
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.buttonBlueColor,
                    ),
                    child: TextConst(
                      title: 'Apply',
                      fontSize: AppConstant.fontSizeThree,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
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
