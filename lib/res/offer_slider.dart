import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';

class OfferSlider extends StatefulWidget {
  const OfferSlider({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OfferSliderState();
  }
}

class _OfferSliderState extends State<OfferSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> _imagePaths = [
    Assets.imageOfferSliderBg,
    Assets.imageOfferSliderBg,
    Assets.imageOfferSliderBg,
    Assets.imageOfferSliderBg,
    Assets.imageOfferSliderBg,
    Assets.imageOfferSliderBg,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight/7,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: _imagePaths.length, itemBuilder: (context,index){
            return Container(
                width: screenWidth/1.5,
                margin: EdgeInsets.only(left: 15 ,right:index==5?15:0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                          child: Image.asset(_imagePaths[index].toString())
            );
          }),
        )
        // CarouselSlider(
        //   items: _imagePaths
        //       .map((path) => Container(
        //             margin: const EdgeInsets.symmetric(horizontal: 5.0),
        //             decoration:
        //                 BoxDecoration(borderRadius: BorderRadius.circular(5)),
        //             child: Image.asset(path, fit: BoxFit.fill),
        //           ))
        //       .toList(),
        //   options: CarouselOptions(
        //     height: screenHeight * 0.14,
        //     viewportFraction: 0.65,
        //     initialPage: 0,
        //     enableInfiniteScroll: true,
        //     reverse: false,
        //     autoPlay: true,
        //     autoPlayInterval: const Duration(seconds: 3),
        //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
        //     autoPlayCurve: Curves.fastOutSlowIn,
        //     enlargeCenterPage: true,
        //     enlargeFactor: 0.3,
        //     scrollDirection: Axis.horizontal,
        //     onPageChanged: (index, reason) {
        //       setState(() {
        //         _current = index;
        //       });
        //     },
        //   ),
        //   carouselController: _controller,
        // ),
        // Removed the Row widget that contained the indicators
      ],
    );
  }
}
