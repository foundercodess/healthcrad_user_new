import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/model/all_medicine_model.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view_model/cart_view_model.dart';
import 'package:health_crad_user/view_model/medicine_view_model.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'text_const.dart';

class DealsListView extends StatefulWidget {
  const DealsListView({
    super.key,
  });

  @override
  State<DealsListView> createState() => DealsListViewState();
}

class DealsListViewState extends State<DealsListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MedicineViewModel>(context, listen: false)
          .allMedicineApi(context, '', '3', '0');
    });
  }

  @override
  Widget build(BuildContext context) {
    final medicineViewModel = Provider.of<MedicineViewModel>(context);
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount:
          medicineViewModel.allMedicineModelData!.allMedicineData?.length,
      itemBuilder: (context, index) {
        return DealsMedicine(
            index: index,
            allMedicineData: medicineViewModel
                .allMedicineModelData!.allMedicineData![index]);
      },
    );
  }
}

class DealsMedicine extends StatelessWidget {

  final int index;
  final AllMedicineData allMedicineData;

  const DealsMedicine(
      {super.key, required this.index, required this.allMedicineData});

  @override
  Widget build(BuildContext context) {
    final medicineViewModel = Provider.of<MedicineViewModel>(context);
    final cartViewModel = Provider.of<CartViewModel>(context);

    return Padding(
      padding: EdgeInsets.only(
          left: index == -1 ? 0 : 15, right: index == 2 ? 15 : 0),
      child: GestureDetector(
        onTap: () {
          medicineViewModel.medicineDetailsApi(context, medicineViewModel.allMedicineModelData!.allMedicineData![index].id.toString());
        },
        child: Container(
          width: screenWidth * 0.37,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.whiteColor,
              border: Border.all(width: 1, color: const Color(0xffAFD9FF))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.2,
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: AppColor.darkGreenColor,
                  ),
                  child: TextConst(
                    // title: '55.5 % OFF',
                    title: '${allMedicineData.discount} % OFF',
                    fontWeight: FontWeight.w600,
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.whiteColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          child: Container(
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.22,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        allMedicineData.image.toString()),
                                    // image: AssetImage(Assets.imageTablelBg),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextConst(
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      title: allMedicineData.name.toString(),
                      fontSize: AppConstant.fontSizeOne,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      int.parse((screenWidth / 20).toStringAsFixed(0)),
                      (i) => TextConst(
                        title: '-',
                        fontSize: AppConstant.fontSizeZero,
                        color: AppColor.greyColor.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRichText(textSpans: [
                            CustomTextSpan(
                                text: "Rs. ",
                                fontWeight: FontWeight.normal,
                                textColor: AppColor.textColor.withOpacity(0.9),
                                fontSize: AppConstant.fontSizeOne),
                            CustomTextSpan(
                                text: "${allMedicineData.sPrice}",
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.normal,
                                textColor: AppColor.textColor,
                                fontSize: AppConstant.fontSizeOne)
                          ]),
                          CustomRichText(textSpans: [
                            CustomTextSpan(
                                text: "Rs. ",
                                fontWeight: FontWeight.normal,
                                textColor: AppColor.blackColor.withOpacity(0.9),
                                fontSize: AppConstant.fontSizeTwo),
                            CustomTextSpan(
                                text: "${allMedicineData.discount}",
                                fontWeight: FontWeight.bold,
                                textColor: AppColor.blackColor,
                                fontSize: AppConstant.fontSizeTwo)
                          ]),
                        ],
                      ),
                      Image.asset(
                        Assets.imageRxBg,
                        width: 15,
                      )
                    ],
                  ),
                ),
                allMedicineData.is_added_to_cart == 0?      Align(
                  alignment: Alignment.center,
                  child: ButtonConst(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: screenHeight * 0.04,
                    onTap: () async {
                      String? getUserData = await UserViewModel().getUser();
                      cartViewModel.addToCartApi(
                          getUserData, allMedicineData.id, '1', context);
                    },
                    color: AppColor.buttonBlueColor,
                    label: 'Add'.toUpperCase(),
                    textColor: AppColor.whiteColor,
                    fontSize: AppConstant.fontSizeTwo,
                    fontWeight: FontWeight.bold,
                  ),
                ):
                Align(
                  alignment: Alignment.center,
                  child : Container(
                    height: screenHeight*0.04,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1,color: AppColor.greyColor.withOpacity(0.4))
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.remove,color: AppColor.primaryColor,size: 25,),

                        TextConst(
                          title: '2',
                          fontSize: AppConstant.fontSizeThree,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        Icon(Icons.add,color: AppColor.primaryColor,size: 25,),
                      ],
                    ),
                  )
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
