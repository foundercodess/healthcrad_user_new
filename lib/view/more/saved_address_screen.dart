import 'package:flutter/material.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view/more/widget/common_app_bar_more.dart';

import '../../generated/assets.dart';
import '../../main.dart';
import '../../res/app_color.dart';
import '../../res/app_constant.dart';
import '../../res/text_const.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leadingWidth: screenWidth,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  Assets.iconsArrowBack,
                  color: AppColor.whiteColor,
                  scale: 3,
                ),
              ),
              AppConstant.spaceWidth10,
              TextConst(
                title: 'Select Address',
                fontSize: AppConstant.fontSizeThree,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: AppColor.scaffoldBgColor,
            padding: const EdgeInsets.only(top: 8),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.addNewAddressScreen);
              },
              child: Container(
                width: screenWidth,
                alignment: Alignment.centerLeft,
                color: AppColor.whiteColor,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: TextConst(
                  textAlign: TextAlign.left,
                  title: '+  Add new address',
                  fontSize: AppConstant.fontSizeTwo,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
          itemCount: 5,
          itemBuilder: (_, int i) {
        return InkWell(
          onTap: (){
            setState(() {
              selectedIndex=i;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            color: AppColor.whiteColor,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  height: 15,
                  width: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == selectedIndex ? AppColor.primaryColor : Colors.transparent,
                      border: Border.all(
                          color:
                              i != selectedIndex ? AppColor.greyColor : Colors.transparent)),
                  child: i == selectedIndex
                      ? Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.whiteColor,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                AppConstant.spaceWidth10,
                Container(
                  width: screenWidth / 1.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConst(
                        title: "Ashutosh Tripathi",
                        fontSize: AppConstant.fontSizeTwo,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      AppConstant.spaceHeight10,
                      TextConst(
                        title:
                            "Sharda Nagar (Banti Kirana Store), Bus Stand, Purnea 854301",
                        fontSize: AppConstant.fontSizeOne,
                        textAlign: TextAlign.left,
                        color: AppColor.textColor,
                      ),
                      AppConstant.spaceHeight10,
                      TextConst(
                        title:
                        "3216556446",
                        fontSize: AppConstant.fontSizeOne,
                        textAlign: TextAlign.left,
                        color: AppColor.blackColor,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ButtonConst(
                  label: "Delete",
                  width: screenWidth / 5,
                  color: Colors.transparent,
                  border: Border.all(color: AppColor.redColor),
                  height: 30,
                  textColor: AppColor.redColor,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
