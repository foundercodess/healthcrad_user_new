import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

import 'text_const.dart';

class OfferingsListView extends StatefulWidget {
  const OfferingsListView({
    super.key,
  });

  @override
  State<OfferingsListView> createState() => OfferingsListViewState();
}

class OfferingsListViewState extends State<OfferingsListView> {
  @override
  Widget build(BuildContext context) {
    List<OfferingModel> offeringModelList = [
      OfferingModel(title: 'Doctors', img: Assets.pngDoctorBgO, onTap: () {}),
      OfferingModel(
          title: 'Medicines', img: Assets.pngMedicinesBgO, onTap: () {}),
      OfferingModel(
          title: 'Ambulance',
          img: Assets.pngAmbuO,
          onTap: () {
            Navigator.pushNamed(context, RoutesName.ambulancePage);
          }),
      OfferingModel(
          title: 'Pathlab',
          img: Assets.pngPathLabBgO,
          onTap: () {
            Navigator.pushNamed(context, RoutesName.pathLab);
          }),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate((offeringModelList.length), (index){
        return GestureDetector(
          onTap: offeringModelList[index].onTap,
          child: Container(
            width: screenWidth * 0.21,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColor.whiteColor,
                boxShadow: [
                  BoxShadow(offset: const Offset(0, 1), color: Colors.grey.shade100, spreadRadius: 1, blurRadius: 3)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: screenWidth / 6.8,
                  width: screenWidth,
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),

                      ),
                    image: DecorationImage(image: AssetImage(offeringModelList[index].img),fit: BoxFit.cover),


                  // child: SvgPicture.asset(
                  //   offeringModelList[index].img,
                  //  fit: BoxFit.fill,
                  // ),
                ),
                ),
                const Spacer(),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 7, top: 5, bottom: 5),
                  child: TextConst(
                    title: offeringModelList[index].title,
                    fontWeight: FontWeight.w600,
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.blackColor,
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        );
      }),
    );
  }
}

class OfferingModel {
  final String title;
  final String img;
  final VoidCallback? onTap;

  OfferingModel({
    required this.title,
    required this.img,
    this.onTap,
  });
}
