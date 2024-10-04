import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';

import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/address_view_model.dart';
import 'package:health_crad_user/view_model/order_view_model.dart';
import 'package:health_crad_user/view_model/path_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class OrderByPrescription extends StatefulWidget {
  const OrderByPrescription({super.key});

  @override
  State<OrderByPrescription> createState() => _OrderByPrescriptionState();
}

class _OrderByPrescriptionState extends State<OrderByPrescription> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final addressViewModel =
        Provider.of<AddressViewModel>(context, listen: false);
    addressViewModel.getAddressApi(context);
    final pathViewModel = Provider.of<PathViewModel>(context, listen: false);
    pathViewModel.ImagePickerClear();
  }

  @override
  Widget build(BuildContext context) {
    final pathViewModel = Provider.of<PathViewModel>(context);
    final orderViewModel = Provider.of<OrderViewModel>(context);
    final addressViewModel = Provider.of<AddressViewModel>(context);
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.whiteColor,
      bottomNavigationBar:   ButtonConst(
        onTap: () {
          if (pathViewModel.base64Image == null) {
            Utils.show("Please Add Your Prescription", context);
          } else {
            orderViewModel.orderByPrescriptionApi(context);
          }
        },
        color: AppColor.primaryColor,
        label: 'Place Order',
        textColor: AppColor.whiteColor,
        fontSize: AppConstant.fontSizeThree,
      ),
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
      body: ListView(
        children: [
          AppConstant.spaceHeight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextConst(
              textAlign: TextAlign.start,
              title: 'Do you have a prescription?',
              fontSize: AppConstant.fontSizeTwo,
              color: AppColor.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppConstant.spaceHeight5,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextConst(
              textAlign: TextAlign.start,
              title:
                  'Just upload it & we will arrange the medicines for you.',
              fontSize: AppConstant.fontSizeOne,
              color: AppColor.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          AppConstant.spaceHeight25,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UploadPrescription(
                  title: 'Use Camera',
                  img: Assets.iconsCamaraIcon,
                  onTap: () {
                    pathViewModel.pickImage(ImageSource.camera, context);
                  },
                ),
                UploadPrescription(
                  title: 'Upload Image',
                  img: Assets.iconsImageUpload,
                  onTap: () {
                    pathViewModel.pickImage(ImageSource.gallery, context);
                  },
                ),
                UploadPrescription(
                  title: 'Upload Pdf',
                  img: Assets.iconsUploadPdf,
                  onTap: () {
                    pathViewModel.pickImage(ImageSource.gallery, context);
                  },
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
          AppConstant.spaceHeight50,
          AppConstant.spaceHeight50,
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.addNewAddressScreen);
            },
            child: Container(
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
          ),
          AppConstant.spaceHeight15,
          addressViewModel.modelAddressData?.getAddressData ==null?const Center(child: CircularProgressIndicator())   :      Consumer<AddressViewModel>(builder: (context, addressCon, _) {
            final selectedAddressData = addressCon
                .modelAddressData!.getAddressData![addressCon.selectedIndex];
            return addressCon.modelAddressData != null ?
                 Container(
                    width: screenWidth,
                    color: AppColor.containerFillColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primaryColor,
                                ),
                                child: Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                              ),
                              AppConstant.spaceWidth15,
                              Column(
                                children: [
                                  TextConst(
                                    textAlign: TextAlign.start,
                                    title: selectedAddressData.userName,
                                    fontSize: AppConstant.fontSizeTwo,
                                    color: AppColor.blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.savedAddressScreen);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: screenHeight * 0.04,
                                  width: screenWidth * 0.25,
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1,
                                          color: AppColor.rBorderSideColor)),
                                  child: TextConst(
                                    title: 'Change',
                                    fontSize: AppConstant.fontSizeTwo,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                          AppConstant.spaceHeight15,
                          Row(
                            children: [
                              AppConstant.spaceWidth25,
                              AppConstant.spaceWidth5,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: screenWidth * 0.7,
                                    child: TextConst(
                                      textAlign: TextAlign.start,
                                      title:
                                          "${selectedAddressData.address} ${selectedAddressData.pincode}",
                                      fontSize: AppConstant.fontSizeTwo,
                                      color: AppColor.textColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  AppConstant.spaceHeight5,
                                  TextConst(
                                    fontWeight: FontWeight.w600,
                                    title:
                                        selectedAddressData.phone.toString(),
                                    fontSize: AppConstant.fontSizeOne,
                                    color: AppColor.blackColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container();
          }),

        ],
      ),
    ));
  }
}

class UploadPrescription extends StatelessWidget {
  const UploadPrescription({
    super.key,
    required this.img,
    required this.title,
    required this.onTap,
  });
  final String title;
  final String img;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pathViewModel = Provider.of<PathViewModel>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight * 0.16,
        width: screenWidth * 0.28,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColor.fadedPrimaryColor),
            borderRadius: BorderRadius.circular(10),
            color: AppColor.containerFillColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            pathViewModel.base64Image == null
                ? Image.asset(
                    img,
                    height: 25,
                    width: 25,
                  )
                : Icon(
                    Icons.check_circle,
                    color: AppColor.greenColor,
                    size: 30,
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
      ),
    );
  }
}
