import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/view_model/order_view_model.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../main.dart';
import '../../res/app_color.dart';
import '../../res/custom_rich_text.dart';
import '../../res/text_const.dart';

class MedicineHistoryOrderDetailScreen extends StatefulWidget {
  const MedicineHistoryOrderDetailScreen({super.key});

  @override
  State<MedicineHistoryOrderDetailScreen> createState() =>
      _MedicineHistoryOrderDetailScreenState();
}

class _MedicineHistoryOrderDetailScreenState
    extends State<MedicineHistoryOrderDetailScreen> {
  int _currentStep = 2;
  final List<String> _steps = [
    'Order placed',
    'Accepted',
    'Pickup',
    'Shipped',
    'Delivered'
  ];

  List<int> starList = [1, 2, 3, 4, 5];

  final ratingOption = ["very poor", "poor", "average", "good", "excellent"];
  int ratingValue = 3;
  final List<GlobalKey<TooltipState>> _tooltipKeys =
      List.generate(5, (_) => GlobalKey<TooltipState>());
  final feedBackCon = TextEditingController();

  void _showTooltip(int index) {
    final dynamic tooltip = _tooltipKeys[index].currentState;
    tooltip.ensureTooltipVisible();
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<OrderViewModel>(context, listen: false).orderHistoryApi(context);

    });
  }
  @override
  Widget build(BuildContext context) {
    final orderViewModel = Provider.of<OrderViewModel>(context);
    final orderDetail = orderViewModel.orderHistoryModel!.orderHistoryData![orderViewModel.selectedIndex];
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Column(

          children: [
            AppConstant.spaceHeight10,
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: AppColor.whiteColor,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TextConst(
                              title: "Order Id: ",
                              color: AppColor.blackColor,
                              fontSize: AppConstant.fontSizeOne,
                            ),
                            TextConst(
                              title: orderDetail.id.toString(),
                              color: AppColor.textColor,
                              fontSize: AppConstant.fontSizeOne,
                            ),
                          ],
                        ),
                        ButtonConst(
                          color: AppColor.buttonBlueColor,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          width: screenWidth / 3.5,
                          borderRadius: BorderRadius.circular(5),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextConst(
                                title: "E-Receipt",
                                fontSize: AppConstant.fontSizeOne * 1.1,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w600,
                              ),
                              Icon(
                                Icons.download_for_offline_rounded,
                                size: 20,
                                color: AppColor.whiteColor,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    AppConstant.spaceHeight15,
                    orderTracking()
                  ]),
            ),
            AppConstant.spaceHeight10,
            medicineList(),
            shippingDetails(),
            AppConstant.spaceHeight10,
            priceDetails(),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              alignment: Alignment.centerLeft,
              child:   Container(
                width: screenWidth,
                color: AppColor.whiteColor,
                alignment: Alignment.centerLeft,
                child: CustomRichText(textSpans: [
                  CustomTextSpan(
                      text: "•  Cash on delivery : ",
                      textColor: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: AppConstant.fontSizeOne),
                  CustomTextSpan(
                    text: " ₹ 400",
                    fontWeight: FontWeight.w600,
                    textColor: AppColor.textColor,
                    fontSize: AppConstant.fontSizeOne,
                  )
                ]),
              ),
            ),
            AppConstant.spaceHeight10,
            ratingOptionUI(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      backgroundColor: AppColor.whiteColor,
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
                color: AppColor.blackColor,
                scale: 3,
              ),
            ),
            AppConstant.spaceWidth10,
            TextConst(
              title: "Order Details",
              fontWeight: FontWeight.w500,
              fontSize: AppConstant.fontSizeThree,
            ),
          ],
        ),
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(Assets.imageCartOutline,    height: 25,
              width: 25,),
            Positioned(
              top: -15,
              right: -5,
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
        AppConstant.spaceWidth15,
      ],
    );
  }

  Widget orderTracking() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextConst(
          title: "Order Status",
          fontSize: AppConstant.fontSizeTwo,
        ),
        AppConstant.spaceHeight15,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextConst(
              textAlign: TextAlign.center,
              title: _steps[_currentStep],
              fontSize: AppConstant.fontSizeThree,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        AppConstant.spaceHeight15,
        SizedBox(
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < _steps.length; i++) ...[
                _buildStep(i, _steps[i]),
              ]
            ],
          ),
        ),
        AppConstant.spaceHeight20,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonConst(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: screenWidth / 2.5,
              borderRadius: BorderRadius.circular(5),
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextConst(
                    title: "See all updates",
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.buttonBlueColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      Assets.iconsArrowBack,
                      color: AppColor.buttonBlueColor,
                      height: 15,
                      width: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget medicineList() {
    final orderViewModel = Provider.of<OrderViewModel>(context);
    final orderDetail = orderViewModel.orderHistoryModel!.orderHistoryData![orderViewModel.selectedIndex].medicinedata;
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: orderDetail!.length,
        itemBuilder: (_, int index) {
final resData=orderDetail[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
            ),
            child: Row(
              children: [
                Image.network(
                  orderDetail[index].image,
                  width: screenWidth / 6,
                ),
                AppConstant.spaceWidth15,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextConst(
                      title: resData.name,
                      color: AppColor.blackColor,
                      fontSize: AppConstant.fontSizeTwo,
                    ),
                    AppConstant.spaceHeight5,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomRichText(textSpans: [
                          CustomTextSpan(
                              text: "MRP: ",
                              fontWeight: FontWeight.w500,
                              textColor: AppColor.textColor,
                              fontSize: AppConstant.fontSizeOne),
                          CustomTextSpan(
                              decoration: TextDecoration.lineThrough,
                              text: "₹ ${orderDetail[index].price}",
                              textColor: AppColor.textColor,
                              fontSize: AppConstant.fontSizeOne,
                              fontWeight: FontWeight.w500)
                        ]),
                        AppConstant.spaceWidth5,
                        Container(
                          height: 20,
                          width: 1,
                          color: AppColor.blackColor.withOpacity(0.6),
                        ),
                        AppConstant.spaceWidth5,
                        CustomRichText(textSpans: [
                          CustomTextSpan(
                              text: "${orderDetail[index].discount} % off",
                              textColor: AppColor.greenColor,
                              fontSize: AppConstant.fontSizeOne,
                              fontWeight: FontWeight.bold),
                        ]),
                      ],
                    ),
                    AppConstant.spaceHeight5,
                    TextConst(
                      title: "${AppConstant.rupeeSymbol} ${orderDetail[index].itemCost}",
                      color: AppColor.blackColor,
                      fontSize: AppConstant.fontSizeTwo,
                      fontWeight: FontWeight.w600,
                    ),
                    TextConst(
                      title: "Quantity: ${orderDetail[index].quantity}",
                      color: AppColor.blackColor,
                      fontSize: AppConstant.fontSizeOne,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget priceDetails() {
    final orderViewModel = Provider.of<OrderViewModel>(context);

    final orderDetail = orderViewModel.orderHistoryModel!.orderHistoryData![orderViewModel.selectedIndex];

    return Container(
      width: screenWidth,
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child:  Column(
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
                  title: '₹ ${orderDetail.totalAmount}',
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
                  title: '-₹ ${orderDetail.discount}',
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


                    text: "₹ ${orderDetail.discount} ",
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w400,
                    textColor: AppColor.textColor,
                    fontSize: AppConstant.fontSizeTwo,
                  ),
                  CustomTextSpan(
                    text: " ₹ ${orderDetail.packagingCharge}",
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
                    text: "₹ ${orderDetail.deliveryCharge} ",
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w400,
                    textColor: AppColor.textColor,
                    fontSize: AppConstant.fontSizeTwo,
                  ),
                  CustomTextSpan(
                    text: " ₹ ${orderDetail.deliveryCharge}",
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
                TextConst(
                  title: '₹ ${orderDetail.couponAmount}',
                  fontSize: AppConstant.fontSizeTwo,
                  color: AppColor.greenColor,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Divider(),
            ),
            AppConstant.spaceHeight5,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColor.searchFieldBgColor,
                  borderRadius: BorderRadius.circular(5)
              ),
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
                    title: '₹ ${orderDetail.totalAmount}',
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
                text: " ₹ ${orderDetail.discount} ",
                fontWeight: FontWeight.bold,
                textColor: AppColor.greenColor,
                fontSize: AppConstant.fontSizeThree,
              ),
              CustomTextSpan(
                text: "on this order",
                textColor: AppColor.greenColor,
                fontSize: AppConstant.fontSizeTwo,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget shippingDetails() {
    final orderViewModel = Provider.of<OrderViewModel>(context);

    final orderDetail = orderViewModel.orderHistoryModel!.orderHistoryData![orderViewModel.selectedIndex];

    return Container(
      width: screenWidth,
      color: AppColor.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextConst(
            title: "Shipping details",
            color: AppColor.textColor,
            fontSize: AppConstant.fontSizeOne,
          ),
          Divider(
            color: AppColor.greyColor.withOpacity(0.3),
          ),
          AppConstant.spaceHeight5,
          TextConst(
            title: orderDetail.userName,
            color: AppColor.blackColor,
            fontSize: AppConstant.fontSizeTwo,
            fontWeight: FontWeight.w500,
          ),
          AppConstant.spaceHeight5,
          TextConst(
            title:orderDetail.address,
            color: AppColor.textColor,
            fontSize: AppConstant.fontSizeOne,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget ratingOptionUI(){
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      color: AppColor.whiteColor,
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextConst(
            title: '•  Rate your experience',
            fontSize: AppConstant.fontSizeOne,
            color: AppColor.blackColor,
            fontWeight: FontWeight.w400,
          ),
          AppConstant.spaceHeight15,
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (i) {
                  return Tooltip(
                    verticalOffset: -50,
                    key: _tooltipKeys[i],
                    message: ratingOption[i],
                    child: InkWell(
                        onTap: () {
                          _showTooltip(i);
                          setState(() {
                            ratingValue = i;
                          });
                        },
                        child: Icon(
                          Icons.star_rounded,
                          color: ratingValue >= i
                              ? AppColor.greenColor
                              : AppColor.greyColor,
                          size: 30,
                        )),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextConst(
                  title: "Submit",
                  color: AppColor.primaryColor,
                  fontSize: AppConstant.fontSizeOne,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          AppConstant.spaceHeight20,
          CustomRichText(textSpans: [
            CustomTextSpan(
              text: "Do you face any problem? ",
              textColor: AppColor.blackColor,
              fontSize: AppConstant.fontSizeOne,
              fontWeight: FontWeight.w600,),
            CustomTextSpan(
                text: "Call Now",
                textColor: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: AppConstant.fontSizeOne)
          ]),
        ],
      ),
    );
  }

  Widget _buildStep(int step, String label, ) {
    bool isActive = step <= _currentStep;
    bool lineActive= _currentStep >= step;
    return SizedBox(
      width: screenWidth/5.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 2,
                width: 15,
                color:step==0? Colors.transparent :lineActive ? const Color(0xff0488A4) : Colors.grey,
              ),
              Container(
                height: 20,width: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greyColor, width: isActive?0:2),
                  shape: BoxShape.circle,
                  color: isActive ? const Color(0xff0488A4) : Colors.white,
                ),
                child: isActive
                    ? const Icon(Icons.check, color: Colors.white, size: 15,)
                    : const Icon(Icons.circle, color: Colors.grey, size: 15,),
              ),
              Container(
                height: 2,
                width: 15,
                color:step>3? Colors.transparent :lineActive ? const Color(0xff0488A4) : Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextConst(title:label, fontSize: AppConstant.fontSizeZero,color: step<3?const Color(0xff0488A4):AppColor.blackColor,),
        ],
      ),
    );
  }
}
