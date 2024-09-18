import 'package:flutter/material.dart';

import 'package:health_crad_user/res/app_color.dart';

class CustomRichText extends StatelessWidget {
  final List<CustomTextSpan> textSpans;
  final TextAlign? textAlign;

  const CustomRichText({super.key, required this.textSpans, this.textAlign});

  @override
  Widget build(BuildContext context) {
    List<TextSpan> children = [];

    for (CustomTextSpan span in textSpans) {
      children.add(
        TextSpan(
          text: span.text, //openSans
          style: TextStyle(
            decoration: span.decoration ?? TextDecoration.none,
            fontSize: span.fontSize ?? MediaQuery.of(context).size.width / 25,
            fontWeight: span.fontWeight ?? FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily:  "Poppins_Regular",
            color: span.textColor ?? AppColor.blackColor,
            overflow: TextOverflow.ellipsis,
            height: 1.5,
          ),
        ),
      );
    }

    return RichText(
      textAlign: textAlign == null ? TextAlign.left : textAlign!,
      text: TextSpan(children: children),
    );
  }
}

class CustomTextSpan {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  CustomTextSpan( {
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.decoration,
  });
}

