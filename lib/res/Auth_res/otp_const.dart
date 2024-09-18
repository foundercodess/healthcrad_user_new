import 'package:flutter/material.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:pinput/pinput.dart';

Widget otpField(TextEditingController? otpController) {
  return SizedBox(
    width: screenWidth,
    height: 50,
    child: Pinput(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      focusedPinTheme: PinTheme(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(8)),
          constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
          margin: const EdgeInsets.only()),
      defaultPinTheme: PinTheme(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500, width: .8),
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(7)),
          constraints: const BoxConstraints(maxWidth: 50, maxHeight: 50),
          margin: const EdgeInsets.only()),
      autofocus: true,
      controller: otpController,
      length: 5,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onChanged: (v) {
        if (v.length == 6) {
          // authProvider.verifyOtp(context, Provider.of<SharedPrefViewModel>(context, listen: false).userToken);
        }
      },
    ),
  );
}
