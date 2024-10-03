import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/details_slider.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view_model/cart_view_model.dart';
import 'package:health_crad_user/view_model/medicine_view_model.dart';
import 'package:health_crad_user/view_model/update_quantity_view_model.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key});

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {

    final medicineViewModel = Provider.of<MedicineViewModel>(context);
    final updateQuantityViewModel = Provider.of<UpdateQuantityViewModel>(context);


    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      bottomNavigationBar: Container(
        height: screenHeight / 14,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            color: AppColor.primaryColor),
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
                        title: 'Quantity: ${medicineViewModel.medicineDetailsData!.medicineModelData!.quantity}',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.whiteColor,
                      ),
                      TextConst(
                        title: 'Rs. ${medicineViewModel.medicineDetailsData!.medicineModelData!.price}',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {



                        // String? getUserData = await UserViewModel().getUser();
                        // cartViewModel.addToCartApi(
                        //     getUserData,  medicineViewModel
                        //     .allMedicineModelData!.allMedicineData![index].id, '1', context);




                      Navigator.pushNamed(context, RoutesName.cartPage);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.whiteColor,
                      ),
                      child: TextConst(
                        title: 'Add to cart',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.primaryColor,
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
        toolbarHeight: kToolbarHeight * 1.3,
        backgroundColor: AppColor.primaryColor,
        leadingWidth: screenWidth,
        leading: Padding(
          padding:  EdgeInsets.only(left: 10),
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
              AppConstant.spaceWidth15,
              TextFieldConst(
                width: screenWidth / 1.4,
                height: 45,
                filled: true,
                fillColor: AppColor.whiteColor,
                keyboardType: TextInputType.text,
                maxLength: 35,
                maxLines: 1,
                prefixIcon:  Padding(
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  child: SvgPicture.asset(
                      Assets.svgSearchIcons,
                      height:10,
                      width: 10,


                  ),
                ),
                hint: "Find medicine...",
                fontSize: AppConstant.fontSizeTwo,
                sufixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  child: SvgPicture.asset(
                    Assets.svgMicIcons,
                    height: 10,
                    width: 10,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ImageIcon(
                  const AssetImage(Assets.iconsCartIcons),
                  size: screenWidth * 0.08,
                  color: AppColor.whiteColor,
                ),
                Positioned(
                  left: screenHeight * 0.028,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppConstant.spaceHeight10,
            Container(
              height: screenHeight / 3.5,
              width: screenWidth,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.network(medicineViewModel.medicineDetailsData!.medicineModelData!.image.toString(),height: screenWidth / 2.5,),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: 60,
                        height: screenHeight / 3.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              Assets.imageRxBg,
                              width: 20,
                            ),
                            Image.asset(
                              Assets.iconsShareIcon,
                              color: AppColor.greyColor,
                              width: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextConst(
                      title: medicineViewModel.medicineDetailsData!.medicineModelData!.name,
                      fontSize: AppConstant.fontSizeThree,
                      color: AppColor.blackColor,
                    ),
                    AppConstant.spaceHeight5,
                    Row(children: [
                      CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "Rs.",
                            fontWeight: FontWeight.normal,
                            textColor: AppColor.textColor.withOpacity(0.9),
                            fontSize: AppConstant.fontSizeOne),
                        CustomTextSpan(
                            text: medicineViewModel.medicineDetailsData!.medicineModelData!.sPrice.toString(),
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.normal,
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeOne)
                      ]),
                      AppConstant.spaceWidth10,
                      CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "${medicineViewModel.medicineDetailsData!.medicineModelData!.discount} % off",
                            fontWeight: FontWeight.normal,
                            textColor: AppColor.greenColor,
                            fontSize: AppConstant.fontSizeOne)
                      ]),
                    ]),
                    CustomRichText(textSpans: [
                      CustomTextSpan(
                          text: "Rs. ",
                          fontWeight: FontWeight.normal,
                          textColor: AppColor.primaryColor,
                          fontSize: AppConstant.fontSizeTwo),
                      CustomTextSpan(
                          text: "${medicineViewModel.medicineDetailsData!.medicineModelData!.discountedAmount}",
                          fontWeight: FontWeight.w600,
                          textColor: AppColor.primaryColor,
                          fontSize: AppConstant.fontSizeTwo)
                    ]),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextConst(
                      title: 'Select Quantity :',
                      fontSize: AppConstant.fontSizeThree,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: screenHeight * 0.038,
                      width: screenWidth * 0.24,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.buttonBgColor, width: 0.5),
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: AssetImage(Assets.pngPlusMinusIcon),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: screenHeight * 0.05,
                              width: screenWidth * 0.095,
                              color: Colors.transparent,
                            ),
                          ),
                          TextConst(
                            title:  medicineViewModel.medicineDetailsData!.medicineModelData!.quantity.toString(),
                            fontSize: AppConstant.fontSizeThree,
                            fontWeight: FontWeight.w500,
                            color: AppColor.blackColor,
                          ),
                          GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              height: screenHeight * 0.05,
                              width: screenWidth * 0.095,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: DetailsSlider(),
            ),
            AppConstant.spaceHeight10,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: TextConst(
                      title: 'Product Introduction',
                      fontSize: AppConstant.fontSizeThree,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  AppConstant.spaceHeight15,
                  TextConst(
                    title: 'Prescription Required *',
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.blackColor,
                  ),
                  AppConstant.spaceHeight10,
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "MARKETER: ",
                        textColor: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeOne),
                    CustomTextSpan(
                        text: medicineViewModel.medicineDetailsData!.medicineModelData!.marketer.toString(),
                        textColor: AppColor.textColor,
                        fontSize: AppConstant.fontSizeOne),
                  ]),
                  AppConstant.spaceHeight10,
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "SALT COMPOSITION: ",
                        textColor: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeOne),
                    CustomTextSpan(
                        text: medicineViewModel.medicineDetailsData!.medicineModelData!.selfComposition.toString(),
                        textColor: AppColor.textColor,
                        fontSize: AppConstant.fontSizeOne),
                  ]),
                  AppConstant.spaceHeight10,
                  CustomRichText(textSpans: [
                    CustomTextSpan(
                        text: "STORAGE: ",
                        textColor: AppColor.blackColor,
                        fontSize: AppConstant.fontSizeOne),
                    CustomTextSpan(
                        text: medicineViewModel.medicineDetailsData!.medicineModelData!.storage.toString(),
                        textColor: AppColor.textColor,
                        fontSize: AppConstant.fontSizeOne),
                  ]),
                  AppConstant.spaceHeight10,
                  TextConst(
                    textAlign: TextAlign.start,
                    title:
                    medicineViewModel.medicineDetailsData!.medicineModelData!.detail.toString(),
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.textColor,
                  ),
                ],
              ),
            ),
            AppConstant.spaceHeight10,
            medicineDisclaimer(),
            AppConstant.spaceHeight10,
          ],
        ),
      ),
    );
  }

  Widget medicineDisclaimer() {
    final medicineViewModel = Provider.of<MedicineViewModel>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: screenWidth,
      color: AppColor.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextConst(
            title: 'DISCLAIMER',
            fontSize: AppConstant.fontSizeThree,
            color: AppColor.blackColor,
          ),
          AppConstant.spaceHeight15,
          TextConst(
            textAlign: TextAlign.start,
            title:
            medicineViewModel.medicineDetailsData!.medicineModelData!.disclaimer.toString(),
            fontSize: AppConstant.fontSizeOne,
            color: AppColor.textColor,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
