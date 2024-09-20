import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';

class DetailsSlider extends StatefulWidget {
  const DetailsSlider({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DetailsSliderState();
  }
}

class _DetailsSliderState extends State<DetailsSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final  imagePaths = [
    {"icon":Assets.iconsExpressIcons, "title":"Superfast delivery", "subtitle":"High priority delivery for all orders"},
    {"icon":Assets.iconsExpressIcons, "title":"Superfast delivery", "subtitle":"High priority delivery for all orders"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: const DecorationImage(
          image: AssetImage(Assets.imageDetailsSilderBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarouselSlider(
            items: imagePaths.map((data) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child:ListTile(leading: Image.asset(data["icon"]!,height: 35,width: 35,),title: TextConst(title: data["title"],fontSize: AppConstant.fontSizeTwo,textAlign: TextAlign.left,),subtitle:TextConst(title: data["subtitle"],fontSize: AppConstant.fontSizeZero,color: AppColor.textColor,textAlign: TextAlign.left,) ,)

              );
            }).toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height/12,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            carouselController: _controller,
          ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star_half_outlined, color: CupertinoColors.systemYellow,),
              AppConstant.spaceWidth10,
              TextConst(title: "Our priority is safe & secure delivery",fontSize: AppConstant.fontSizeOne,color: AppColor.whiteColor,fontWeight: FontWeight.w500,),
            ],
          ),
        )
        ],
      ),
    );
  }
}
