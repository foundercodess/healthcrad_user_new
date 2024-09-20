import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/address_list.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

class OrderByPrescription extends StatefulWidget {
  const OrderByPrescription({super.key});

  @override
  State<OrderByPrescription> createState() => _OrderByPrescriptionState();
}

class _OrderByPrescriptionState extends State<OrderByPrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
    backgroundColor: AppColor.primaryColor,
    leadingWidth: screenWidth,
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
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
            title: 'Order by Prescription',
            fontSize: AppConstant.fontSizeThree,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    ),
          ),
          body: Padding(
    padding: const EdgeInsets.only(top: 20,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: TextConst(
            title: 'Do you have a prescription?',
            fontSize: AppConstant.fontSizeTwo,
            color: AppColor.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppConstant.spaceHeight5,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal:15,
          ),
          child: TextConst(
            title:
                'Just upload it & we will arrange the medicines for you.',
            fontSize: AppConstant.fontSizeOne,
            color: AppColor.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppConstant.spaceHeight25,
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UploadPrescription(
                title: 'Use Camera',
                img: Assets.iconsCamaraIcon,
              ),
              UploadPrescription(
                title: 'Upload Image',
                img: Assets.iconsImageUpload,
              ),
              UploadPrescription(
                title: 'Upload Pdf',
                img: Assets.iconsUploadPdf,
              ),
            ],
          ),
        ),
        AppConstant.spaceHeight50,
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1, color: AppColor.textColor.withOpacity(0.2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.09,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              Assets.imageDoctorBg,
                            ),
                            alignment: Alignment.center,
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      top: screenHeight * 0.059,
                      right: screenWidth * 0.02,
                      child: Container(
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.06,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.iconsGreenCallIcon,
                              ),
                              scale: 2,
                            )),
                      )),
                ],
              ),
              Container(
                alignment: Alignment.center,
                width: screenWidth * 0.6,
                height: screenHeight * 0.07,
                child: TextConst(
                  textAlign: TextAlign.start,
                  title:
                      'Our pharmacist will call to confirm the medicines in your prescription.',
                  fontSize: AppConstant.fontSizeOne,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        Container(
          width: screenWidth,
          alignment: Alignment.center,
          color: AppColor.containerFillColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: TextConst(
            textAlign: TextAlign.center,
            title: '+ Add new address',
            fontSize: AppConstant.fontSizeTwo,
            color: AppColor.primaryColor,
          ),
        ),
        AppConstant.spaceHeight15,
        Container(
            height: screenHeight/5.5,
            color: AppColor.containerFillColor,
            child: const AddressListView()),
        ButtonConst(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.commonOrderScreen,
                arguments: {
                  "name":
                      "Your order by prescription has been\nsuccessfully placed"
                });
          },
          color: AppColor.primaryColor,
          label: 'Place Order',
          fontWeight: FontWeight.bold,
          textColor: AppColor.whiteColor,
          fontSize: AppConstant.fontSizeThree,
        ),
      ],
    ),
          ),
        );
  }
}

class UploadPrescription extends StatelessWidget {
  const UploadPrescription({
    super.key,
    required this.img,
    required this.title,
    this.onTap,
  });
  final String title;
  final String img;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.16,
      width: screenWidth * 0.28,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: AppColor.fadedPrimaryColor),
          borderRadius: BorderRadius.circular(10),
          color: AppColor.containerFillColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            img,
            height: 25,
            width: 25,
          ),
          SizedBox(
            height: screenHeight * 0.06,
            width: screenWidth * 0.2,
            child: TextConst(
              title: title,
              fontSize: AppConstant.fontSizeTwo,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
