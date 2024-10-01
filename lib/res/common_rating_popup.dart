import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';

import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../view_model/rating_view_model.dart';



class CommonRatingPopup extends StatelessWidget {
  final String title;
final dynamic data;



  const CommonRatingPopup({
    super.key,
    required this.title,
    this.data,
  });

  // @override
  @override
  Widget build(BuildContext context) {
    final ratingViewModel = Provider.of<RatingViewModel>(context);

    return Dialog(
      elevation: 3,
        insetPadding: const EdgeInsets.symmetric(horizontal: 25),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.whiteColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                  text: title,
                  fontWeight: FontWeight.w600,
                  fontSize: AppConstant.fontSizeThree,
                  color: AppColor.blackColor,
                  textAlign: TextAlign.center),
              AppConstant.spaceHeight10,
              ratingViewModel.rateWidget(context,data["type"],data["review_id"],isOpenInPopUp: true),
              AppConstant.spaceHeight15,
              Container(
                width: screenWidth,
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: AppColor.rBorderSideColor),
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 20,
                        child: Image.asset(Assets.pngMessageIcon,scale: 2,)),
                    Expanded(
                      child: TextField(
                        controller: ratingViewModel.reviewMsgCon,
                        minLines: 2,
                        maxLines: null,
                        decoration: InputDecoration(
                          fillColor: AppColor.containerFillColor,
                          border: InputBorder.none,
                          hintText: 'Write Your Message',
                          hintStyle: TextStyle(color: AppColor.textColor, fontSize: AppConstant.fontSizeTwo, fontFamily:  "Poppins_Regular",),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppConstant.spaceHeight15,
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    ratingViewModel.ratingApi(context,data);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.buttonBlueColor,
                    ),
                    child: TextConst(
                      title: 'Submit',
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
