import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> _imagePaths = [
    'assets/franchisie_slider.png',
    'assets/icons/slider.png',
    'assets/icons/slider.png',
    'assets/icons/slider.png',
    'assets/icons/slider.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            CarouselSlider(
              items: _imagePaths
                  .map((path) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5),
                        decoration:
                            BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("assets/franchisie_slider.png"),
                                  fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(12)),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: screenHeight*0.25,
                viewportFraction: 1.02,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _imagePaths.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
          ],
        ),
      ),
    );
  }
}
