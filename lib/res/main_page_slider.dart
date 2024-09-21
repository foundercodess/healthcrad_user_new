import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';

class MainPageSlider extends StatefulWidget {
  const MainPageSlider({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageSliderState();
  }
}

class _MainPageSliderState extends State<MainPageSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

   List<dynamic> _imagePaths = [
    {'img':Assets.imageDoctorBg,"title":"Book doctors appointment in just 30 sec."},
    {'img':Assets.imageMedicineBgN,"title":"Quick doorstep medicine delivery with affordable price."},
    {'img':Assets.imageAmbulanceBgN,"title":"Instant Ambulance Bookings at the time of need."},
     {'img':Assets.imagePathLabBgN,"title":"Digital / Physical pathlab reports delivery."},
    {'img':Assets.imageManyMoreBg,"title":"and\nmany more..."},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: _imagePaths
              .map((path) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: screenHeight/5.5,
                          width: screenWidth/2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(path["img"]),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        AppConstant.spaceHeight30,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: screenHeight*0.08,
                          width: screenWidth,
                          child: TextConst(
                            textAlign: TextAlign.start,
                                                 title:_imagePaths[_current]['title'],
                            fontSize: AppConstant.fontSizeHeading / 1.6,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
              ))
              .toList(),
          options: CarouselOptions(
            height: screenHeight * 0.34,
            viewportFraction: 1,
            enlargeFactor: 0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          carouselController: _controller,
        ),
        AppConstant.spaceHeight30,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _imagePaths.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    border: _current != entry.key
                        ? Border.all(color: AppColor.greyColor, width: 1)
                        : Border.all(color: Colors.transparent),
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? AppColor.primaryColor
                        .withOpacity(_current == entry.key ? 0.9 : 0.4):AppColor.whiteColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
