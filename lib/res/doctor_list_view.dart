import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';

import 'text_const.dart';

class DoctorListView extends StatefulWidget {
  const DoctorListView({
    super.key,
  });

  @override
  State<DoctorListView> createState() => DoctorListViewState();
}

class DoctorListViewState extends State<DoctorListView> {
  List<DoctorModel> doctorModelList = [
    DoctorModel(title: 'General Physician', img: Assets.imageGeneralPhysician),
    DoctorModel(title: 'Kidney Specialist', img: Assets.imageKideny),
    DoctorModel(title: 'Heart Specialist', img: Assets.imageHeart),
    DoctorModel(title: 'Dentist', img: Assets.imageDentist),
    DoctorModel(title: 'Eye Specialist', img: Assets.imageEye),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: doctorModelList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(
                left: 15,right: index==4?15:0,
                bottom: 3
            ),
            child: Container(
              width: screenWidth * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(color: Colors.black12,blurRadius: 5)
                ],
                color: AppColor.whiteColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenHeight * 0.12,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)
                      ),
                        image: DecorationImage(
                            image: AssetImage(doctorModelList[index].img),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextConst(
                      title: doctorModelList[index].title,
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppConstant.spaceHeight5,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DoctorModel {
  final String title;
  final String img;

  DoctorModel({
    required this.title,
    required this.img,
  });
}
