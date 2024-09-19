import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view/more/widget/common_app_bar_more.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {


  @override
  Widget build(BuildContext context) {
    List<MoreGridModel> offeringModelList = [
      MoreGridModel(
          title: 'My Profile',
          img: Assets.iconsProfileIcon,
          subTitle: 'Update Account', onTap: () {
        Navigator.pushNamed(context, RoutesName.viewProfile);
      }),
      MoreGridModel(
          title: 'Appointment',
          img: Assets.iconsAppoMore,
          subTitle: 'Appointment History', onTap: () {
            Navigator.pushNamed(context, RoutesName.appointmentHistoryScreen);
      }),
      MoreGridModel(
          title: 'Ambulance',
          img: Assets.iconsAmbulMore,
          subTitle: 'Booking History', onTap: () {
            Navigator.pushNamed(context, RoutesName.ambulanceBookingHistory);
      }),
      MoreGridModel(
          title: 'My Orders',
          img: Assets.iconsMyOrderMore,
          subTitle: 'Order Status', onTap: () {
        Navigator.pushNamed(context, RoutesName.medicineOrderHistoryScreen);
      }),
      MoreGridModel(
          title: 'My Address',
          img: Assets.iconsAddressMore,
          subTitle: 'Save Address', onTap: () {
        Navigator.pushNamed(context, RoutesName.savedAddressScreen);

      }),
      MoreGridModel(
          title: 'Help', img: Assets.iconsHelpMore, subTitle: 'Let us help you', onTap: () {  }),
      MoreGridModel(
          title: 'Policy',
          img: Assets.iconsPolicyIcon,
          subTitle: 'Privacy Policy', onTap: () {  }),
      MoreGridModel(
          title: 'T&C', img: Assets.iconsTCMore, subTitle: 'Company Policies', onTap: () {  }),
      MoreGridModel(
          title: 'FAQs', img: Assets.iconsFaqMore, subTitle: 'Quick Answers', onTap: () {  }),
      MoreGridModel(
          title: 'Logout', img: Assets.iconsLogOut, subTitle: 'Back to see you', onTap: () {  }),
    ];
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: const CommonAppBarMore(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: screenHeight/5,
                width: screenWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imageMoreProfileBg),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      right: screenWidth * 0.06,
                      top: screenHeight * 0.01,
                      child: Container(
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.05,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(Assets.iconsMoreCheckIcon))),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth/1.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height:screenWidth * 0.2,
                            width: screenWidth * 0.2,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(Assets.imageDoctorBg),
                                    fit: BoxFit.cover)),
                          ),
                          AppConstant.spaceWidth20,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextConst(
                                title: 'Hello,',
                                fontSize: AppConstant.fontSizeThree,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                              AppConstant.spaceHeight10,
                              TextConst(
                                title: 'Om Shankar Sharma',
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                              TextConst(
                                title: '+917584259456',
                                fontSize: AppConstant.fontSizeOne,
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppConstant.spaceHeight25,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 2.4),
                itemCount: offeringModelList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: offeringModelList[index].onTap,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColor.whiteColor,
                          border: Border.all(
                              width: 1,
                              color: AppColor.textColor.withOpacity(0.1))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                offeringModelList[index].img,
                                scale: 1.9,
                              ),
                              SizedBox(
                                width: screenWidth*0.27,
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextConst(
                                      title: offeringModelList[index].title,
                                      fontSize: AppConstant.fontSizeTwo,
                                      color: AppColor.blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    TextConst(
                                      title: offeringModelList[index].subTitle,
                                      fontSize: AppConstant.fontSizeZero,
                                      color: AppColor.textColor,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              AppConstant.spaceHeight25,
              TextConst(
                title: 'HealthCRAD\nby Bhavah Healthcare pvt. ltd.',
                fontSize: AppConstant.fontSizeOne,
                color: AppColor.textColor.withOpacity(0.6),
              ),
              AppConstant.spaceHeight15,
            ],
          ),
        ),
      ),
    );
  }
}



class MoreGridModel {
  final String img;
  final String title;
  final String subTitle;
  final VoidCallback? onTap;

  MoreGridModel({
    required this.title,
    required this.img,
    required this.subTitle,
  this.onTap,
  });
}
