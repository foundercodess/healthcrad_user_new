import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view/payments/widget/payment_mode_widget.dart';
import 'package:health_crad_user/view_model/address_view_model.dart';
import 'package:health_crad_user/view_model/cart_view_model.dart';
import 'package:health_crad_user/view_model/coupon_view_model.dart';
import 'package:health_crad_user/view_model/order_view_model.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final addressViewModel =
        Provider.of<AddressViewModel>(context, listen: false);
    addressViewModel.getAddressApi(context);
  }

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    final couponViewModel = Provider.of<CouponViewModel>(context);
    final orderViewModel = Provider.of<OrderViewModel>(context);


    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: AppColor.whiteColor,
            border:
                Border(top: BorderSide(color: AppColor.greyColor, width: 0.5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        title: '₹ 550',
                        fontSize: AppConstant.fontSizeThree,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      orderViewModel.createOrderApi(paymentMode.toString(), context);

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: screenHeight * 0.045,
                      width: screenWidth * 0.38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.buttonBgColor,
                      ),
                      child: TextConst(
                        title: 'Place Order',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600,
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
          leadingWidth: screenWidth * 0.35,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                TextConst(
                  title: 'Payment',
                  fontSize: AppConstant.fontSizeThree,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          // title:
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Container(
                height: screenHeight * 0.038,
                width: screenWidth * 0.28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.whiteColor,
                    image: const DecorationImage(
                        image: AssetImage(Assets.iconsPSecureIcons),
                        fit: BoxFit.fill)),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.1),
            child:
                Consumer<AddressViewModel>(builder: (context, addressCon, _) {
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
              final selectedAddressData = addressCon
                  .modelAddressData!.getAddressData![addressCon.selectedIndex];
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
                                  color:
                                      AppColor.primaryColor.withOpacity(0.4))),
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
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        TextConst(
                          title: 'Item Cost',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        TextConst(
                          title:
                              '₹ ${cartViewModel.vModelData!.itemCost.toString()}',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextConst(
                          title: 'Discount',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        TextConst(
                          title:
                              '-₹ ${cartViewModel.vModelData!.totalDiscount.toString()}',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.greenColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextConst(
                          title: 'Green Packaging',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomRichText(textSpans: [
                          CustomTextSpan(
                            text:
                                "₹ ${(50 + (cartViewModel.vModelData!.packagingCharge ?? 0)).toString()} ",
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeTwo,
                          ),
                          CustomTextSpan(
                            text:
                                " ₹ ${cartViewModel.vModelData!.packagingCharge.toString()}",
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.blackColor,
                            fontSize: AppConstant.fontSizeTwo,
                          ),
                        ]),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextConst(
                          title: 'Delivery Charge',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomRichText(textSpans: [
                          CustomTextSpan(
                            text:
                                "₹ ${(70 + (cartViewModel.vModelData!.deliveryCharge ?? 0)).toString()} ",
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeTwo,
                          ),
                          CustomTextSpan(
                            text:
                                " ₹ ${((cartViewModel.vModelData!.deliveryCharge)).toString()}",
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.blackColor,
                            fontSize: AppConstant.fontSizeTwo,
                          ),
                        ]),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextConst(
                              title: 'Coupon Discount',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.greenColor,
                              fontWeight: FontWeight.w400,
                            ),
                            Image.asset(
                              Assets.iconsDiscountIcon,
                              height: 25,
                              width: 25,
                            ),
                          ],
                        ),
                        Consumer<CouponViewModel>(
                            builder: (context, couponCon, _) {
                          return TextConst(
                            title:
                                '₹ ${((cartViewModel.vModelData!.descountCupon == "0" && couponCon.appliedCoupon != null ? couponCon.appliedCoupon!.discountPrice : 0)).toString()} ',
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.greenColor,
                            fontWeight: FontWeight.w400,
                          );
                        }),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Divider(),
                    ),
                    AppConstant.spaceHeight5,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColor.searchFieldBgColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextConst(
                            title: 'Total Cost',
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.buttonBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                          TextConst(
                            title:
                                '₹ ${((cartViewModel.vModelData!.totalAmount)).toString()}',
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.buttonBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    AppConstant.spaceHeight10,
                    CustomRichText(textSpans: [
                      CustomTextSpan(
                        text: "You will save",
                        textColor: AppColor.greenColor,
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                      CustomTextSpan(
                        text:
                            " ₹ ${(70 + (cartViewModel.vModelData!.deliveryCharge ?? 0) - (cartViewModel.vModelData!.deliveryCharge ?? 0) + (50 + (cartViewModel.vModelData!.packagingCharge ?? 0) - (cartViewModel.vModelData!.packagingCharge ?? 0)) + (cartViewModel.vModelData!.totalDiscount ?? 0)).toString()}",
                        fontWeight: FontWeight.bold,
                        textColor: AppColor.greenColor,
                        fontSize: AppConstant.fontSizeThree,
                      ),
                      CustomTextSpan(
                        text: " on this order",
                        textColor: AppColor.greenColor,
                        fontSize: AppConstant.fontSizeTwo,
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            couponViewModel.appliedCoupon == null
                ? GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.applyCouponPage);
                    },
                    child: Container(
                      color: AppColor.whiteColor,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        leading: Image.asset(Assets.gifCouponGif),
                        title: TextConst(
                          textAlign: TextAlign.start,
                          title: 'Apply Coupon',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                        ),
                        trailing: Image.asset(
                          Assets.iconsIconsArrowRight,
                          scale: 3,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                  )
                : AppConstant.spaceHeight10,
            couponViewModel.appliedCoupon != null
                ? Container(
                    width: screenWidth,
                    color: AppColor.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextConst(
                                title: 'Coupon Applied',
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.greenColor,
                              ),
                              AppConstant.spaceWidth10,
                              Container(
                                height: 18,
                                width: 18,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            Assets.iconsGreenCheckIcons))),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              couponViewModel.removeAppliedCoupon(context);
                            },
                            child: TextConst(
                              title: 'REMOVE',
                              fontSize: AppConstant.fontSizeOne,
                              color: AppColor.redColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.iconsPaymentIcon,
                          width: 25,
                        ),
                        AppConstant.spaceWidth10,
                        TextConst(
                          title: 'Payment Mode',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    AppConstant.spaceHeight15,
                    paymentModeWidget(0, "Cash on Delivery"),
                    paymentModeWidget(1, "Online Payment"),
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
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.iconsCartIcons,
                          height: 25,
                          width: 25,
                        ),
                        AppConstant.spaceWidth15,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "Cancellation ",
                                  textColor: AppColor.redColor,
                                  fontSize: AppConstant.fontSizeZero),
                              CustomTextSpan(
                                  text:
                                      'is allowed as long as the product is not pickup.',
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeZero)
                            ]),
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "Cancellation ",
                                  textColor: AppColor.redColor,
                                  fontSize: AppConstant.fontSizeZero),
                              CustomTextSpan(
                                  text:
                                      'will not be allowed after the product is pickup.',
                                  textColor: AppColor.blackColor,
                                  fontSize: AppConstant.fontSizeZero)
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10
          ],
        ),
      ),
    );
  }

  int paymentMode = 0;
  Widget paymentModeWidget(int index, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          paymentMode = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        width: screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 1,
                color: index == paymentMode
                    ? AppColor.primaryColor
                    : AppColor.greyColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            children: [
              Container(
                height: 18,
                width: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == paymentMode
                        ? AppColor.primaryColor
                        : Colors.transparent,
                    border: Border.all(
                        color: index != paymentMode
                            ? AppColor.greyColor
                            : Colors.transparent)),
                child: index == paymentMode
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
              TextConst(
                title: title,
                fontSize: AppConstant.fontSizeTwo,
                color: AppColor.textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
