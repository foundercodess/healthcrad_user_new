import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/view_model/doctor_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';
import 'text_const.dart';

class AppointmentListView extends StatefulWidget {
  const AppointmentListView({
    super.key,
  });

  @override
  State<AppointmentListView> createState() => AppointmentListViewState();
}

class AppointmentListViewState extends State<AppointmentListView> {
  // List<AppointmentModel> appointmentModelList = [
  //   AppointmentModel(title: 'Doctors', img: Assets.imageDoctorBg),
  //   AppointmentModel(title: 'Medicines', img: Assets.imageMedicineBgN),
  //   AppointmentModel(title: 'Ambulance', img: Assets.imageAmbulanceBgN),
  //   AppointmentModel(title: 'Pathlab', img: Assets.imagePathLabBgN),
  // ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DoctorViewModel>(context, listen: false)
          .getDoctorApi(context, "");
    });
  }

  @override
  Widget build(BuildContext context) {
    final doctorViewModel = Provider.of<DoctorViewModel>(context);
    return doctorViewModel.getDoctorModelData == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            itemCount:
                doctorViewModel.getDoctorModelData!.getDoctorModelData!.length,
            itemBuilder: (context, index) {
              final resData = doctorViewModel
                  .getDoctorModelData?.getDoctorModelData?[index];
              return Padding(
                padding: EdgeInsets.only(left: 15, right: index == 3 ? 15 : 0),
                child: InkWell(
                  onTap: () {
                    doctorViewModel.selectDoctorProfile(index);
                    Navigator.pushNamed(context, RoutesName.doctorProfile);
                  },
                  child: Container(
                    width: screenWidth / 2.5,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: const Color(0xffAFD9FF)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: screenHeight / 8.3,
                          width: screenWidth,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(doctorViewModel
                                      .getDoctorModelData!
                                      .getDoctorModelData![index]
                                      .imgUrl
                                      .toString()),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: screenWidth,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppConstant.spaceHeight10,
                                TextConst(
                                  title: doctorViewModel.getDoctorModelData!
                                      .getDoctorModelData![index].name,
                                  maxLines: 1,
                                  fontSize: AppConstant.fontSizeTwo,
                                  color: AppColor.blackColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                AppConstant.spaceHeight5,
                                TextConst(
                                  title: doctorViewModel
                                      .getDoctorModelData!
                                      .getDoctorModelData![index]
                                      .departmentName,
                                  fontSize: AppConstant.fontSizeOne,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                TextConst(
                                  title: doctorViewModel.getDoctorModelData!
                                      .getDoctorModelData![index].address,
                                  fontSize: AppConstant.fontSizeOne,
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                TextConst(
                                  title:
                                      "${doctorViewModel.getDoctorModelData!.getDoctorModelData![index].exp} Years exp.",
                                  fontSize: AppConstant.fontSizeOne,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                AppConstant.spaceHeight10,
                                Row(
                                  children: [
                                    Container(
                                      height: screenHeight * 0.036,
                                      width: screenWidth * 0.08,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColor.buttonBlueColor,
                                      ),
                                      alignment: Alignment.center,
                                      child: TextConst(
                                        title: "₹",
                                        fontSize: AppConstant.fontSizeThree,
                                        color: AppColor.whiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: '',
                                      ),
                                    ),
                                    AppConstant.spaceWidth5,
                                    TextConst(
                                      title: doctorViewModel.getDoctorModelData!
                                          .getDoctorModelData![index].fees
                                          .toString(),
                                      fontSize: AppConstant.fontSizeThree,
                                      color: AppColor.greenColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                AppConstant.spaceHeight10,
                                ButtonConst(
                                  height: screenHeight * 0.045,
                                  width: screenWidth * 0.45,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.slotPage);
                                  },
                                  color: const Color(0xff097EEB),
                                  label: 'Book Appointment',
                                  textColor: AppColor.whiteColor,
                                  fontSize: AppConstant.fontSizeOne,
                                  fontWeight: FontWeight.bold,
                                ),
                                AppConstant.spaceHeight5,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}

class AppointmentModel {
  final String title;
  final String img;

  AppointmentModel({
    required this.title,
    required this.img,
  });
}
