import 'package:flutter/material.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import '../../../generated/assets.dart';
import '../../splash_screen.dart';

class CommonAppBarMore extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBarMore({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.whiteColor,
      leading: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            Assets.iconsArrowBack,
            color: AppColor.blackColor,
            scale: 3,
          ),
        ),
      ),
      centerTitle: true,
      title: TextConst(
        title: title,
        fontSize: AppConstant.fontSizeThree,
        color: AppColor.blackColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}