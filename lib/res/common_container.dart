import 'package:flutter/material.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    this.child, this.height, this.width, this.alignment, this.decoration, this.border,
  });
  final Widget? child;
  final double? height;
  final double? width;
  final Decoration? decoration;
  final AlignmentGeometry? alignment;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:alignment?? Alignment.center,
      height: height??55,
      width: width??screenWidth/2.3,
      decoration: decoration??BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: border??Border.all(width: 0.5, color: AppColor.rBorderSideColor),
        color: AppColor.containerFillColor,
      ),
      child: child ??
          const Row(
            children: [],
          ),
    );
  }
}