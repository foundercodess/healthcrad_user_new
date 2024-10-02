import 'package:flutter/material.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

import 'package:health_crad_user/view_model/address_view_model.dart';
import 'package:provider/provider.dart';
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
  // int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    final addressViewModel =
        Provider.of<AddressViewModel>(context, listen: false);
    addressViewModel.getAddressApi(context);
  }

  @override
  Widget build(BuildContext context) {
    final addressViewModel = Provider.of<AddressViewModel>(context);
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
              onTap: () {
                Navigator.pushNamed(context, RoutesName.addNewAddressScreen);
              },
              child: Container(
                width: screenWidth,
                alignment: Alignment.centerLeft,
                color: AppColor.whiteColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
      body: addressViewModel.modelAddressData == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount:
                  addressViewModel.modelAddressData?.getAddressData?.length,
              itemBuilder: (_, int i) {
                final resData =
                    addressViewModel.modelAddressData?.getAddressData?[i];
                return InkWell(
                  onTap: () {
                    addressViewModel.setSelectedIndex(
                        i,
                        resData.address.toString(),
                        resData.userName.toString());
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: AppColor.whiteColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
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
                              color: i == addressViewModel.selectedIndex
                                  ? AppColor.primaryColor
                                  : Colors.transparent,
                              border: Border.all(
                                  color: i != addressViewModel.selectedIndex
                                      ? AppColor.greyColor
                                      : Colors.transparent)),
                          child: i == addressViewModel.selectedIndex
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
                        SizedBox(
                          width: screenWidth / 1.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextConst(
                                title: resData!.userName.toString(),
                                fontSize: AppConstant.fontSizeTwo,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w600,
                              ),
                              AppConstant.spaceHeight10,
                              TextConst(
                                title: resData.address.toString() +
                                    resData.landmark.toString(),
                                fontSize: AppConstant.fontSizeOne,
                                textAlign: TextAlign.left,
                                color: AppColor.textColor,
                              ),
                              AppConstant.spaceHeight10,
                              TextConst(
                                title: resData.phone.toString(),
                                fontSize: AppConstant.fontSizeOne,
                                textAlign: TextAlign.left,
                                color: AppColor.blackColor,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ButtonConst(
                          onTap: () {
                            addressViewModel.deleteAddressApi(
                                resData.id, context);
                          },
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
