// import 'package:flutter/material.dart';
// import 'package:health_crad_user/generated/assets.dart';
// import 'package:health_crad_user/main.dart';
// import 'package:health_crad_user/res/app_color.dart';
// import 'package:health_crad_user/res/app_constant.dart';
// import 'package:health_crad_user/res/common_container.dart';
// import 'package:health_crad_user/res/text_const.dart';
// import 'package:health_crad_user/view_model/service/register_view_model.dart';
// import 'package:provider/provider.dart';
//
// class CustomDropdown extends StatefulWidget {
//
//   const CustomDropdown({super.key});
//
//   @override
//   CustomDropdownState createState() => CustomDropdownState();
// }
//
// class CustomDropdownState extends State<CustomDropdown> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RegisterViewModel>(builder: (context, rvm, child) {
//       return SizedBox(
//         height: screenHeight / 3,
//         child: Stack(
//           clipBehavior: Clip.hardEdge,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 rvm.setDropdownOpen(true);
//               },
//               child: CommonContainer(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Image.asset(
//                       Assets.iconsSelectIcon,
//                       scale: 2.5,
//                       color: AppColor.primaryColor,
//                     ),
//                     TextConst(
//                       title: rvm.isSelectedValue,
//                       fontSize: AppConstant.fontSizeTwo,
//                       color: AppColor.textColor,
//                     ),
//                     Image.asset(
//                       Assets.iconsArrowDown,
//                       scale: 2.5,
//                       color: AppColor.plus91Color,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             if (rvm.isDropdownOpen)
//               Positioned(
//                 top: screenHeight * 0.08,
//                 left: 0,
//                 right: 0,
//                 child: Material(
//                   elevation: 4, // Provides elevation to make dropdown stand out
//                   borderRadius: BorderRadius.circular(8),
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: rvm.genderList.map((item) {
//                         return GestureDetector(
//                           onTap: () {
//                             rvm.setSelectedValue(item);
//                             // Debugging
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(vertical: 8),
//                             child: CommonContainer(
//                               alignment: Alignment.center,
//                               height: screenHeight * 0.04,
//                               width: screenWidth * 0.3,
//                               child: TextConst(
//                                 title: item,
//                                 fontSize: AppConstant.fontSizeTwo,
//                                 color: AppColor.textColor,
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/common_container.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/view_model/service/register_view_model.dart';
import 'package:provider/provider.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  bool _isDropdownOpen = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (context, rvm, child) {
      return PopupMenuButton<String>(
        offset: const Offset(0, 50),
        color: AppColor.whiteColor,
        constraints: BoxConstraints(
          maxWidth: screenWidth * 0.43,
        ),
        onSelected: (String value) {
          rvm.setSelectedValue(value);
          setState(() {
            _isDropdownOpen = false;
          });
        },
        onOpened: () {
          setState(() {
            _isDropdownOpen = true;
          });
        },
        itemBuilder: (BuildContext context) {
          return rvm.genderList.map((String item) {
            return PopupMenuItem<String>(
              value: item,
              child: CommonContainer(
                alignment: Alignment.center,
                height: screenHeight * 0.05,
                width: screenWidth * 0.5,
                child: TextConst(
                  title: item,
                  fontSize: AppConstant.fontSizeTwo,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList();
        },
        child: CommonContainer(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                Assets.iconsSelectIcon,
                height: 25,
                width: 25,
                color: AppColor.primaryColor,
              ),
              TextConst(
                title: rvm.isSelectedValue,
                fontSize: AppConstant.fontSizeTwo,
                color: AppColor.textColor,
              ),
              Transform.flip(
                flipX:_isDropdownOpen? true:false,
                child: Image.asset(
                  Assets.iconsArrowDown,
                  height: 20,
                  width: 20,
                  color: AppColor.plus91Color,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
