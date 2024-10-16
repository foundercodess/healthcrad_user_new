import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/cart_list.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';

import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view/path_lab/widgets/file_selection_bottomsheet.dart';
import 'package:health_crad_user/view_model/address_view_model.dart';
import 'package:health_crad_user/view_model/cart_view_model.dart';
import 'package:health_crad_user/view_model/path_view_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    final pathViewModel = Provider.of<PathViewModel>(context, listen: false);
    pathViewModel.ImagePickerClear();
    cartViewModel.cartViewApi(context);
    Provider.of<AddressViewModel>(context, listen: false)
        .getAddressApi(context);
  }

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    final pathViewModel = Provider.of<PathViewModel>(context);
    final addressViewModel = Provider.of<AddressViewModel>(context);
    return  cartViewModel.loadingAdd?
    Center(child: CircularProgressIndicator(color: AppColor.primaryColor,))
        :cartViewModel.vModelData!.status == 400
        ? cartEmpty():Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  border: Border(
                      top: BorderSide(color: AppColor.greyColor, width: 0.5))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: screenWidth,
                      color: AppColor.whiteColor,
                      child: Image.asset(
                        Assets.iconsSafeIcon,
                        scale: 4,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        int.parse((screenWidth / 8).toStringAsFixed(0)),
                        (i) => TextConst(
                          title: '-',
                          fontSize: AppConstant.fontSizeZero,
                          color: AppColor.textColor.withOpacity(0.3),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextConst(
                              title:
                                  '₹ ${cartViewModel.vModelData!.totalAmount.toString()}',
                              fontSize: AppConstant.fontSizeThree,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            if (addressViewModel
                                .modelAddressData!.getAddressData!.isEmpty) {
                              Utils.show("Please Add Your Address", context);
                              Navigator.pushNamed(
                                  context, RoutesName.addNewAddressScreen);
                            } else if (pathViewModel.base64Image == null) {
                              Utils.show(
                                  "Please Add Your Prescription", context);
                            } else {
                              Navigator.pushNamed(context, RoutesName.payment);
                            }
                          },
                          child: Container(
                            height: screenHeight * 0.045,
                            width: screenWidth * 0.38,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.buttonBgColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextConst(
                                  title: 'Proceed',
                                  fontSize: AppConstant.fontSizeTwo,
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                AppConstant.spaceWidth10,
                                Image.asset(
                                  Assets.iconsIconsArrowRight,
                                  scale: 2.8,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
                  title: 'My Cart',
                  fontSize: AppConstant.fontSizeThree,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.1),
            child: addressViewModel.modelAddressData?.getAddressData == null
                ? const Center(child: CircularProgressIndicator())
                : Consumer<AddressViewModel>(builder: (context, addressCon, _) {
                    if (addressCon.modelAddressData!.getAddressData!.isEmpty) {
                      return Container(
                        color: AppColor.scaffoldBgColor,
                        padding: const EdgeInsets.only(top: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.addNewAddressScreen);
                          },
                          child: Container(
                            width: screenWidth,
                            alignment: Alignment.centerLeft,
                            color: AppColor.whiteColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: TextConst(
                              textAlign: TextAlign.left,
                              title: '+  Add new address',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }
                    final selectedAddressData = addressCon.modelAddressData!
                        .getAddressData![addressCon.selectedIndex];
                    return Container(
                      height: screenHeight * 0.1,
                      width: screenWidth,
                      color: AppColor.whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenWidth / 1.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRichText(textSpans: [
                                    CustomTextSpan(
                                        text: "Deliver to: ",
                                        fontWeight: FontWeight.w400,
                                        textColor: AppColor.blackColor,
                                        fontSize: AppConstant.fontSizeOne),
                                    CustomTextSpan(
                                        text: "${selectedAddressData.userName}",
                                        textColor: AppColor.blackColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: AppConstant.fontSizeOne)
                                  ]),
                                  AppConstant.spaceHeight5,
                                  TextConst(
                                    title: selectedAddressData.address,
                                    fontSize: AppConstant.fontSizeOne,
                                    color: AppColor.textColor,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesName.savedAddressScreen);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: screenHeight * 0.04,
                                width: screenWidth / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        width: 1,
                                        color: AppColor.primaryColor
                                            .withOpacity(0.4))),
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
                      ),
                    );
                  }),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppConstant.spaceHeight10,
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return FileSelectionBottomSheet();
                    });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: screenWidth,
                height: screenHeight * 0.07,
                color: AppColor.whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.05,
                      child: TextConst(
                        textAlign: TextAlign.start,
                        title:
                            'Some of the products from your order requires prescription, Please Attach',
                        fontSize: AppConstant.fontSizeOne,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    pathViewModel.base64Image == null
                        ? Image.asset(
                            Assets.iconsCamaraIcon,
                            scale: 1.5,
                            color: AppColor.primaryColor,
                          )
                        : Icon(
                            Icons.check_circle,
                            color: AppColor.greenColor,
                            size: 30,
                          )
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            const CartListView(),
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextConst(
                      title: 'Price Details',
                      fontSize: AppConstant.fontSizeTwo,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    AppConstant.spaceHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextConst(
                              title: 'Item Cost',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            AppConstant.spaceHeight5,
                            TextConst(
                              title: 'Discount',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            AppConstant.spaceHeight5,
                            TextConst(
                              title: 'Green Packaging',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            AppConstant.spaceHeight5,
                            TextConst(
                              title: 'Delivery Charge',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextConst(
                              title:
                                  '₹ ${cartViewModel.vModelData!.itemCost.toString()}',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w400,
                            ),
                            AppConstant.spaceHeight5,
                            TextConst(
                              title:
                                  '-₹ ${cartViewModel.vModelData!.totalDiscount.toString()}',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.greenColor,
                              fontWeight: FontWeight.w400,
                            ),
                            AppConstant.spaceHeight5,
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text:
                                      "₹ ${(50 + (cartViewModel.vModelData!.packagingCharge ?? 0)).toString()}",
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.textColor,
                                  fontSize: AppConstant.fontSizeTwo),
                              CustomTextSpan(
                                  text:
                                      " ₹ ${cartViewModel.vModelData!.packagingCharge.toString()}",
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeTwo)
                            ]),
                            AppConstant.spaceHeight5,
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text:
                                      "₹ ${(70 + (cartViewModel.vModelData!.deliveryCharge ?? 0)).toString()} ",
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.textColor,
                                  fontSize: AppConstant.fontSizeTwo),
                              CustomTextSpan(
                                  text:
                                      " ₹ ${((cartViewModel.vModelData!.deliveryCharge)).toString()}",
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeTwo)
                            ]),
                          ],
                        ),
                      ],
                    ),
                    AppConstant.spaceHeight10,
                    const Divider(),
                    AppConstant.spaceHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextConst(
                          title: 'Total Cost',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        TextConst(
                          title:
                              '₹ ${((cartViewModel.vModelData!.totalAmount)).toString()}',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    CustomRichText(textSpans: [
                      CustomTextSpan(
                          text: "You will save",
                          textColor: AppColor.greenColor,
                          fontSize: AppConstant.fontSizeTwo),
                      CustomTextSpan(
                          text:
                              " ₹ ${(70 + (cartViewModel.vModelData!.deliveryCharge ?? 0) - (cartViewModel.vModelData!.deliveryCharge ?? 0) + (50 + (cartViewModel.vModelData!.packagingCharge ?? 0) - (cartViewModel.vModelData!.packagingCharge ?? 0)) + (cartViewModel.vModelData!.totalDiscount ?? 0)).toString()}",

                          // text: " ₹ ${((cartViewModel.vModelData!.totalDiscount ?? 0)).toString()} ",
                          fontWeight: FontWeight.bold,
                          textColor: AppColor.greenColor,
                          fontSize: AppConstant.fontSizeThree),
                      CustomTextSpan(
                          text: " on this order",
                          textColor: AppColor.greenColor,
                          fontSize: AppConstant.fontSizeTwo)
                    ]),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
          ],
        ),
      ),
    );
  }

  Widget cartEmpty() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextConst(
              title: "Your Cart is empty!",
              fontSize: AppConstant.fontSizeThree,
            ),
            AppConstant.spaceHeight20,
            Container(
              width: screenWidth / 2.5,
              height: screenWidth / 2.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(Assets.pngCartBox))),
            ),
            AppConstant.spaceHeight10,
            TextConst(
              title:
                  "You have no items added in the cart.\nExplore and add products you like",
              fontSize: AppConstant.fontSizeTwo,
              color: AppColor.textColor,
            ),
            AppConstant.spaceHeight20,
            ButtonConst(
              onTap: () {
                Navigator.pushReplacementNamed(context, RoutesName.medicines);
              },
              label: "add product".toUpperCase(),
              color: AppColor.primaryColor,
              width: screenWidth / 2,
              textColor: AppColor.whiteColor,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
