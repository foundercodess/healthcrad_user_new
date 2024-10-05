import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/common_delete_popup.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/view_model/cart_view_model.dart';
import 'package:health_crad_user/view_model/update_quantity_view_model.dart';
import 'package:provider/provider.dart';

import 'text_const.dart';

class CartListView extends StatefulWidget {
  const CartListView({
    super.key,
  });

  @override
  State<CartListView> createState() => CartListViewState();
}

class CartListViewState extends State<CartListView> {
  int number = 2;
  // bool selectedIndex=true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartViewModel>(context, listen: false).cartViewApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    final updateQuantityViewModel = Provider.of<UpdateQuantityViewModel>(context);

    return cartViewModel.vModelData == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartViewModel.vModelData?.viewCartData!.length,
            itemBuilder: (context, index) {

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: screenWidth,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screenWidth / 5,
                          width: screenWidth / 5,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.imageTablelBg),
                                  fit: BoxFit.contain)),
                        ),
                        SizedBox(
                          width: screenWidth / 1.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextConst(
                                title: cartViewModel
                                    .vModelData?.viewCartData?[index].name,
                                fontSize: AppConstant.fontSizeTwo,
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackColor,
                              ),
                              AppConstant.spaceHeight5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomRichText(textSpans: [
                                            CustomTextSpan(
                                                text: "MRP: ",
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColor.textColor,
                                                fontSize:
                                                    AppConstant.fontSizeOne),
                                            CustomTextSpan(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                text:
                                                    "₹ ${cartViewModel.vModelData!.viewCartData?[index].price}",
                                                textColor: AppColor.textColor,
                                                fontSize:
                                                    AppConstant.fontSizeOne,
                                                fontWeight: FontWeight.w500)
                                          ]),
                                          AppConstant.spaceWidth5,
                                          Container(
                                            height: 20,
                                            width: 1,
                                            color: AppColor.blackColor
                                                .withOpacity(0.6),
                                          ),
                                          AppConstant.spaceWidth5,
                                          CustomRichText(textSpans: [
                                            // CustomTextSpan(
                                            //     text: "OFF: ",
                                            //     fontWeight: FontWeight.w500,
                                            //     textColor: AppColor.textColor,
                                            //     fontSize: AppConstant.fontSizeOne),
                                            CustomTextSpan(
                                                text:
                                                    "${cartViewModel.vModelData!.viewCartData?[index].discount} % off",
                                                textColor: AppColor.greenColor,
                                                fontSize:
                                                    AppConstant.fontSizeOne,
                                                fontWeight: FontWeight.bold),
                                          ]),
                                        ],
                                      ),
                                      AppConstant.spaceHeight5,
                                      TextConst(
                                        title: cartViewModel
                                            .vModelData!
                                            .viewCartData?[index]
                                            .discountedAmount
                                            .toString(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppConstant.fontSizeTwo,
                                        color: AppColor.blackColor,
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CommonDeletePopup(
                                                title:
                                                    'Do you want to delete the added medicines',
                                                yes: () {
                                                  cartViewModel.deleteToCartApi(
                                                      cartViewModel
                                                          .vModelData!
                                                          .viewCartData?[index]
                                                          .id,
                                                      context, index);
                                                });
                                          });
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  Assets.iconsDeleteIcon),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.iconsExpressIcons,
                          height: 25,
                          width: 25,
                        ),
                        AppConstant.spaceWidth5,
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: CustomRichText(textSpans: [
                            CustomTextSpan(
                                text: "Express ",
                                fontWeight: FontWeight.w600,
                                textColor: AppColor.blackColor,
                                fontSize: AppConstant.fontSizeZero),
                            CustomTextSpan(
                                text: "Delivery within 3 to 4 days.",
                                textColor: AppColor.textColor,
                                fontSize: AppConstant.fontSizeZero,
                                fontWeight: FontWeight.w300),
                          ]),
                        ),
                        const Spacer(),
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
                                onTap: () {
                                  setState(() {
                                    setState(() {
                                      updateQuantityViewModel.updateQuantityApi(
                                        int.parse('${cartViewModel.vModelData!.viewCartData?[index].productQuantity}')-1,
                                        '${cartViewModel.vModelData!.viewCartData?[index].id}',
                                        context,
                                      );
                                    });
                                  });
                                },
                                child: Container(
                                  height: screenHeight * 0.05,
                                  width: screenWidth * 0.095,
                                  color: Colors.transparent,
                                ),
                              ),
                              TextConst(
                                title: (cartViewModel.vModelData!.viewCartData?[index].productQuantity ?? 0).toString(),
                                fontSize: AppConstant.fontSizeThree,
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackColor,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    updateQuantityViewModel.updateQuantityApi(
                                      int.parse('${cartViewModel.vModelData!.viewCartData?[index].productQuantity}')+1,
                                      '${cartViewModel.vModelData!.viewCartData?[index].id}',
                                      context,
                                    );
                                  });
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

                        // SizedBox(
                        //   height: screenHeight * 0.04,
                        //   width: screenWidth /4.5,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Container(
                        //         alignment: Alignment.center,
                        //         height: 25,
                        //         width: 25,
                        //         decoration: const BoxDecoration(
                        //             color: Colors.blue,
                        //             shape: BoxShape.circle,
                        //             image: DecorationImage(
                        //                 image: AssetImage(Assets.iconsBMinusIcons),
                        //                 fit: BoxFit.fill)),
                        //       ),
                        //       TextConst(
                        //         title: '2',
                        //         fontSize: AppConstant.fontSizeOne,
                        //         color: AppColor.blackColor,
                        //         fontWeight: FontWeight.w600,
                        //       ),
                        //       Container(
                        //         alignment: Alignment.center,
                        //         height: 25,
                        //         width:25,
                        //         decoration: const BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             image: DecorationImage(
                        //                 image: AssetImage(Assets.iconsBPlusIcons),
                        //                 fit: BoxFit.fill)),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              );
            },
          );
  }
}

class CartModel {
  final String title;
  final String img;

  CartModel({
    required this.title,
    required this.img,
  });
}
