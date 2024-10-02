import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/deals_list_view.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/view_model/medicine_view_model.dart';
import 'package:provider/provider.dart';

import '../../utils/routes/routes_name.dart';

class MedicinesPage extends StatefulWidget {
  const MedicinesPage({super.key});

  @override
  State<MedicinesPage> createState() => _MedicinesPageState();
}

class _MedicinesPageState extends State<MedicinesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<MedicineViewModel>(context, listen: false).allMedicineApi(context,'','10','0');
    });
  }
  @override
  Widget build(BuildContext context) {
    final medicineViewModel = Provider.of<MedicineViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: screenHeight / 14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
            color: AppColor.buttonBlueColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConst(
                        title: 'Quantity: 2',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.whiteColor,
                      ),
                      TextConst(
                        title: 'Rs. 5,126',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.cartPage);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.whiteColor,
                      ),
                      child: TextConst(
                        title: 'Go to cart',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.buttonBlueColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
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
                title: 'Medicines',
                fontSize: AppConstant.fontSizeThree,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ImageIcon(
                  const AssetImage(Assets.iconsCartIcons),
                  size: screenWidth * 0.08,
                  color: AppColor.whiteColor,
                ),
                Positioned(
                  left: screenHeight * 0.026,
                  bottom: screenHeight * 0.017,
                  child: Container(
                    alignment: Alignment.center,
                    height: screenHeight * 0.04,
                    width: screenWidth * 0.04,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.redColor,
                    ),
                    child: TextConst(
                      title: '3',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        // bottom: PreferredSize(
        //   preferredSize:const Size.fromHeight(kToolbarHeight*1.4),
        //   child: Container(
        //     color: AppColor.whiteColor,
        //     child: searchTextField(),
        //   ),
        // ),
      ),
      body:medicineViewModel.allMedicineModelData ==null?Center(child: CircularProgressIndicator()) : SingleChildScrollView(

        child: Column(
          children: [
            // AppConstant.spaceHeight10,
            searchTextField(),
            AppConstant.spaceHeight20,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: medicineViewModel.allMedicineModelData!.allMedicineData?.length,
              itemBuilder: (context, index) {
                return  DealsMedicine(index: -1, allMedicineData: medicineViewModel.allMedicineModelData!.allMedicineData![index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,vertical: 15
      ),
      child: TextFieldConst(
        borderRadius: BorderRadius.circular(5),
        fillColor: AppColor.searchFieldBgColor,
        keyboardType: TextInputType.text,
        maxLength: 35,
        maxLines: 1,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 12,bottom: 12),
          child: SvgPicture.asset(
              Assets.svgSearchIcons,
              height:10,
              width: 10,


          ),
        ),
        hintColor: Colors.black.withOpacity(.6),
        hint: "Search for medicines & doctors",
        fontSize: AppConstant.fontSizeTwo,
        sufixIcon: Padding(
          padding: const EdgeInsets.only(top: 12,bottom: 12),
          child: SvgPicture.asset(
            Assets.svgMicIcons,

            height: 10,
            width: 10,
          ),
        ),
      ),
    );
  }
}
