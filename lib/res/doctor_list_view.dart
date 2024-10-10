import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/doctor_view_model.dart';
import 'package:provider/provider.dart';

import 'text_const.dart';

class DoctorListView extends StatefulWidget {
  const DoctorListView({
    super.key,
  });

  @override
  State<DoctorListView> createState() => DoctorListViewState();
}

class DoctorListViewState extends State<DoctorListView> {
  @override
  Widget build(BuildContext context) {
    final doctorViewModel = Provider.of<DoctorViewModel>(context);
    return doctorViewModel.doctorDepartmentModelData == null
        ? Utils.loading()
        : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount:
                doctorViewModel.doctorDepartmentModelData?.doctorCat!.length,
            itemBuilder: (context, index) {
              final lastIndex = doctorViewModel.doctorDepartmentModelData?.doctorCat!.length;
              return GestureDetector(
                onTap: () {
                  doctorViewModel.getDoctorApi(
                      context,
                      doctorViewModel
                          .doctorDepartmentModelData!.doctorCat![index].id
                          .toString());
                  Navigator.pushNamed(context, RoutesName.cTapDoctor);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15, right: index == (lastIndex! - 1 )? 15 : 0, bottom: 3),
                  child: Container(
                    width: screenWidth * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 5)
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
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(doctorViewModel
                                      .doctorDepartmentModelData!
                                      .doctorCat![index]
                                      .image
                                      .toString()),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextConst(
                            title: doctorViewModel.doctorDepartmentModelData!
                                .doctorCat?[index].name,
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
