import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {

  List<DoctorGridModel> doctorGridModelList = [
    DoctorGridModel(title: 'General Physician', img: Assets.imageGeneralPhysician),
    DoctorGridModel(title: 'Kidney\nSpecialist', img: Assets.imageKideny),
    DoctorGridModel(title: 'Heart Specialist', img: Assets.imageHeart),
    DoctorGridModel(title: 'Dentist', img: Assets.imageDentist),
    DoctorGridModel(title: 'Eye Specialist', img: Assets.imageEye), DoctorGridModel(title: 'General Physician', img: Assets.imageGeneralPhysician),
    DoctorGridModel(title: 'Kidney\nSpecialist', img: Assets.imageKideny),
    DoctorGridModel(title: 'Heart Specialist', img: Assets.imageHeart),
    DoctorGridModel(title: 'Dentist', img: Assets.imageDentist),
    DoctorGridModel(title: 'Eye Specialist', img: Assets.imageEye),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
        appBar:  AppBar(
          toolbarHeight: kToolbarHeight,
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
                AppConstant.spaceWidth15,
                TextConst(
                  title: 'Find Doctors',
                  fontSize: AppConstant.fontSizeThree,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize:const Size.fromHeight(kToolbarHeight*1.2),
            child: Container(
              color: AppColor.whiteColor,
              child: searchTextField(),
            ),
          ),
        ),

      body:Column(
        children: [
          AppConstant.spaceHeight10,
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 2/2.5),
              itemCount: doctorGridModelList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.cTapDoctor);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.whiteColor,
                      boxShadow: [
                        BoxShadow(offset: const Offset(0, 1), color: Colors.grey.shade100, spreadRadius: 1, blurRadius: 3)
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: screenHeight * 0.10,
                          width: screenWidth,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(doctorGridModelList[index].img),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15),
                          child: TextConst(
                            textAlign: TextAlign.start,
                            title: doctorGridModelList[index].title,
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        AppConstant.spaceHeight5,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          AppConstant.spaceHeight10,
        ],
      )


    );
  }
  Widget searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10
      ),
      child: TextFieldConst(
        borderRadius: BorderRadius.circular(5),
        fillColor: AppColor.searchFieldBgColor,
        keyboardType: TextInputType.text,
        maxLength: 35,
        maxLines: 1,
        prefixIcon:  Padding(
          padding: const EdgeInsets.only(top: 12,bottom: 12),
          child: SvgPicture.asset(
              Assets.svgSearchIcons,
              height:10,
              width: 10,
              color: AppColor.blueColor

          ),
        ),
        hintColor: Colors.black.withOpacity(.6),
        hint: "Search doctors..",
        fontSize: AppConstant.fontSizeTwo,
        sufixIcon: Padding(
          padding: const EdgeInsets.only(top: 12,bottom: 12),
          child: SvgPicture.asset(
            Assets.svgMicIcons,
            color: AppColor.blueColor,
            height: 10,
            width: 10,
          ),
        ),
      ),
    );
  }
}


class DoctorGridModel {
  final String img;
  final String title;
  final VoidCallback? onTap;

  DoctorGridModel({
    required this.title,
    required this.img,
    this.onTap,
  });
}
