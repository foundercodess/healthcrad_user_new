// import 'package:flutter/material.dart';
// import 'package:health_crad_user/generated/assets.dart';
// import 'package:health_crad_user/main.dart';
// import 'package:health_crad_user/res/Auth_res/auth_bg.dart';
// import 'package:health_crad_user/res/app_btn.dart';
// import 'package:health_crad_user/res/app_color.dart';
// import 'package:health_crad_user/res/app_constant.dart';
//
// import 'package:health_crad_user/res/text_const.dart';
// import 'package:health_crad_user/utils/routes/routes_name.dart';
//
// import '../../res/Auth_res/otp_const.dart';
//
// class SingUpOtpScreen extends StatefulWidget {
//   const SingUpOtpScreen({super.key});
//
//   @override
//   State<SingUpOtpScreen> createState() => _SingUpOtpScreenState();
// }
//
// class _SingUpOtpScreenState extends State<SingUpOtpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: AppColor.primaryColor,
//       appBar: AppBar(
//         toolbarHeight: screenHeight * 0.1,
//         backgroundColor: AppColor.primaryColor,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Image.asset(
//             Assets.iconsArrowBack,
//             scale: 1.9,
//           ),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextConst(
//               title: 'Fill the otp',
//               fontSize: AppConstant.fontSizeLarge,
//               color: AppColor.whiteColor,
//             ),
//             SizedBox(
//               height: screenHeight * 0.01,
//             ),
//             TextConst(
//               title: 'Verify your account using otp',
//               fontSize: AppConstant.fontSizeOne,
//               color: AppColor.whiteColor,
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         height: screenHeight,
//         width: screenWidth,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(screenWidth * 0.1),
//               topRight: Radius.circular(screenWidth * 0.1)),
//           color: Colors.white,
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: screenWidth * 0.07, vertical: screenHeight * .04),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextConst(
//                 title: 'Otp',
//                 fontSize: AppConstant.fontSizeTwo,
//                 color: AppColor.otpColor,
//               ),
//               SizedBox(
//                 height: screenHeight * 0.02,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(5, (index) {
//                   return CustomOtpPage(context, index);
//                 }),
//               ),
//               SizedBox(
//                 height: screenHeight * 0.02,
//               ),
//               TextConst(
//                 title: 'Resend otp',
//                 fontSize: AppConstant.fontSizeTwo,
//                 color: AppColor.primaryColor,
//               ),
//               SizedBox(
//                 height: screenHeight * 0.06,
//               ),
//               ButtonConst(
//                 onTap: () {
//                   Navigator.pushNamed(context, RoutesName.loginOtpScreen);
//                 },
//                 color: AppColor.primaryColor,
//                 label: 'Signup',
//                 textColor: AppColor.whiteColor,
//                 fontSize: AppConstant.fontSizeThree,
//               ),
//               const Spacer(),
//               const AuthBg()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
