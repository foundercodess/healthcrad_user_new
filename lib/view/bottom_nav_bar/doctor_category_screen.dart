import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../view_model/doctor_view_model.dart';

class DoctorCategoryScreen extends StatefulWidget {
  const DoctorCategoryScreen({super.key});

  @override
  State<DoctorCategoryScreen> createState() => _DoctorCategoryScreenState();
}

class _DoctorCategoryScreenState extends State<DoctorCategoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DoctorViewModel>(context, listen: false)
          .doctorCatApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final doctorViewModel = Provider.of<DoctorViewModel>(context);
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
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
        ),
        body: doctorViewModel.doctorDepartmentModelData == null
            ? Utils.loading()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    AppConstant.spaceHeight10,
                    searchTextField(),
                    AppConstant.spaceHeight20,
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 20.0,
                              childAspectRatio: 2 / 2.5),
                      itemCount: doctorViewModel
                          .doctorDepartmentModelData?.doctorCat!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            doctorViewModel.getDoctorApi(
                                context,
                                doctorViewModel.doctorDepartmentModelData!
                                    .doctorCat![index].id
                                    .toString());
                            Navigator.pushNamed(context, RoutesName.cTapDoctor);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 1),
                                      color: Colors.grey.shade100,
                                      spreadRadius: 1,
                                      blurRadius: 3)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: screenHeight * 0.10,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(doctorViewModel
                                              .doctorDepartmentModelData!
                                              .doctorCat![index]
                                              .image
                                              .toString()),
                                          fit: BoxFit.fill)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextConst(
                                    textAlign: TextAlign.start,
                                    title: doctorViewModel
                                        .doctorDepartmentModelData!
                                        .doctorCat?[index]
                                        .name,
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
                    AppConstant.spaceHeight10,
                  ],
                ),
              ));
  }

  Widget searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFieldConst(
        borderRadius: BorderRadius.circular(5),
        fillColor: AppColor.searchFieldBgColor,
        keyboardType: TextInputType.text,
        maxLength: 35,
        maxLines: 1,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: SvgPicture.asset(
            Assets.svgSearchIcons,
            height: 10,
            width: 10,
          ),
        ),
        hintColor: Colors.black.withOpacity(.6),
        hint: "Search doctors..",
        fontSize: AppConstant.fontSizeTwo,
        sufixIcon: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
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
