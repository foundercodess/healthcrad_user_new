import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/view_model/slider_view_model.dart';
import 'package:provider/provider.dart';

import '../model/slider_model.dart';

class OfferSlider extends StatelessWidget {
  final List<CommonModel> imageList;
  const OfferSlider({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    final sliderViewModel = Provider.of<SliderViewModel>(context);
    return imageList.isNotEmpty?Column(
      children: [
        SizedBox(
          width: screenWidth,
          height: screenHeight/9,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: imageList.length, itemBuilder: (context,index){
            return Container(
                width: screenWidth/1.5,
                margin: EdgeInsets.only(left: 15 ,right:index==5?15:15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                          child: Image.network(sliderViewModel.sliderModelData!.offerSlider![index].image.toString())
            );
          }),
        )
      ],
    ):Container();
  }
}
