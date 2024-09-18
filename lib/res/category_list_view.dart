import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';

import 'text_const.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({
    super.key,
  });

  @override
  State<CategoryListView> createState() => CategoryListViewState();
}

class CategoryListViewState extends State<CategoryListView> {
  List<CategoryModel> categoryModelList = [
    CategoryModel(img: Assets.imageCatListBg1, tittle: 'Personal\nCare', subtittle: 'Personal care products\nare used for wellbeing, \nbeauty, and\n cleaning.'),
    CategoryModel(img: Assets.imageCatListBg2, tittle: 'Diabetes\nMedicines', subtittle: 'Controlling blood sugar \nthrough diet, medication \nis the main treatment.'),
    CategoryModel(img: Assets.imageCatListBg3, tittle: 'OTC \nMedicines', subtittle: 'OTC medicines can \nhelp protect your health.'),
    CategoryModel(img: Assets.imageCatListBg4, tittle: '', subtittle: ''),
    CategoryModel(img: Assets.imageCatListBg5, tittle: '', subtittle: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,

      itemCount: categoryModelList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            left: 15,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: screenWidth * 0.43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(categoryModelList[index].img),
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
