import 'package:flutter/material.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import '../../../generated/assets.dart';

class CommonAppBarMore extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBarMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.whiteColor,
      leading: Image.asset(
        Assets.iconsArrowBack,
        color: AppColor.blackColor,
        scale: 3,
      ),
      centerTitle: true,
      title: TextConst(
        title: 'Account',
        fontSize: AppConstant.fontSizeThree,
        color: AppColor.blackColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}