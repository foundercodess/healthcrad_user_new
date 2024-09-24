import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/view_model/medicine_view_model.dart';
import 'package:provider/provider.dart';

import 'text_const.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({
    super.key,
  });

  @override
  State<CategoryListView> createState() => CategoryListViewState();
}

class CategoryListViewState extends State<CategoryListView> {
  // List<CategoryModel> categoryModelList = [
  //   CategoryModel(img: Assets.pngBabyMother, tittle: 'Personal\nCare', subtittle: 'Personal care products\nare used for wellbeing, \nbeauty, and\n cleaning.'),
  //   CategoryModel(img: Assets.pngDiabetesMedicines, tittle: 'Diabetes\nMedicines', subtittle: 'Controlling blood sugar \nthrough diet, medication \nis the main treatment.'),
  //   CategoryModel(img: Assets.pngOtcMedicines, tittle: 'OTC \nMedicines', subtittle: 'OTC medicines can \nhelp protect your health.'),
  //   CategoryModel(img: Assets.pngPersonalCare, tittle: '', subtittle: ''),
  //   CategoryModel(img: Assets.pngWellnessItems, tittle: '', subtittle: ''),
  // ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<MedicineViewModel>(context, listen: false).medicineCatApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final medicineViewModel = Provider.of<MedicineViewModel>(context);
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,

      itemCount: medicineViewModel.medicineModelData!.medicineCatData?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            left: 15, right: index==4?15:0
          ),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: screenWidth * 0.43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    // image: AssetImage(categoryModelList[index].img),
                    image: NetworkImage(medicineViewModel.medicineModelData!.medicineCatData![index].image.toString()),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CategoryModel {
  final String img;
  final String tittle;
  final String subtittle;

  CategoryModel({
    required this.img,
    required this.tittle,
    required this.subtittle
  });
}
