import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/appointment_list_view.dart';
import 'package:health_crad_user/res/category_list_view.dart';
import 'package:health_crad_user/res/deals_list_view.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/carousel_silder.dart';
import 'package:health_crad_user/res/doctor_list_view.dart';
import 'package:health_crad_user/res/offer_slider.dart';
import 'package:health_crad_user/res/offerings_list_view.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarConst(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstant.spaceHeight15,
            searchTextField(),
            AppConstant.spaceHeight15,
            const CarouselWithIndicator(),
            AppConstant.spaceHeight30,
            orderOptions(),
            AppConstant.spaceHeight30,
            ourOffering(),
            AppConstant.spaceHeight30,
            specialOfferForYou(),
            AppConstant.spaceHeight30,
            limitedTimeOffer(),
            AppConstant.spaceHeight30,
            shopMedicineByCategory(),
            AppConstant.spaceHeight30,
            bestOffer(),
            AppConstant.spaceHeight30,
            doctorFromTopCategories(),
            AppConstant.spaceHeight30,
            bookAppointmentForTopDoctor(),
            AppConstant.spaceHeight30,
            textInfoMessage(),
            AppConstant.spaceHeight30,
            aboutApp(),
          ],
        ),
      ),
    );
  }

  // PreferredSizeWidget appBarConst() {
  //   return AppBar(
  //     toolbarHeight: kToolbarHeight*1.2,
  //     shape: Border(
  //       bottom: BorderSide(
  //         color: Colors.black.withOpacity(0.05),
  //         width: 2.0,
  //       ),
  //     ),
  //     elevation: 2,
  //     leadingWidth: screenWidth / 2,
  //     leading: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
  //       child: Image.asset(Assets.imageAppLogo),
  //     ),
  //     actions: [
  //       Padding(
  //         padding: EdgeInsets.only(right: screenWidth * 0.05),
  //         child: InkWell(
  //           onTap: () {
  //             Navigator.pushNamed(context, RoutesName.notificationPage);
  //           },
  //           child: Stack(
  //             clipBehavior: Clip.none,
  //             children: [
  //               const Icon(Icons.notifications_outlined, size: 30,),
  //               Positioned(
  //                 left: screenHeight * 0.02,
  //                 bottom: screenHeight * 0.01,
  //                 child: Container(
  //                   alignment: Alignment.center,
  //                   height: screenHeight * 0.04,
  //                   width: screenWidth * 0.04,
  //                   decoration: const BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color: Colors.red,
  //                   ),
  //                   child: TextConst(
  //                     title: '3',
  //                     fontSize: AppConstant.fontSizeOne,
  //                     color: AppColor.whiteColor,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       AppConstant.spaceWidth10,
  //       InkWell(
  //         onTap: () {
  //           Navigator.pushNamed(context, RoutesName.cartPage);
  //         },
  //         child: Stack(
  //           clipBehavior: Clip.none,
  //           children: [
  //             Image.asset(Assets.imageCartOutline),
  //             Positioned(
  //               top: -15,
  //               right: -5,
  //               child: Container(
  //                 alignment: Alignment.center,
  //                 height: screenHeight * 0.04,
  //                 width: screenWidth * 0.04,
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: AppColor.redColor,
  //                 ),
  //                 child: TextConst(
  //                   title: '3',
  //                   fontSize: AppConstant.fontSizeOne,
  //                   color: AppColor.whiteColor,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       AppConstant.spaceWidth15,
  //     ],
  //   );
  // }

  PreferredSizeWidget appBarConst() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight * 1.2),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  color: Colors.grey.shade100,
                  spreadRadius: 1,
                  blurRadius: 3)
            ]),
        child: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: kToolbarHeight * 1.2,
          shape: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.05),
              width: 2.0,
            ),
          ),
          elevation: 0, // Remove default elevation to avoid double shadow
          leadingWidth: screenWidth / 2,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Image.asset(Assets.imageAppLogo),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.05),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.notificationPage);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(
                      Icons.notifications_outlined,
                      size: 30,
                    ),
                    Positioned(
                      left: screenHeight * 0.02,
                      bottom: screenHeight * 0.01,
                      child: Container(
                        alignment: Alignment.center,
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.04,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: TextConst(
                          title: '3',
                          fontSize: AppConstant.fontSizeOne,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppConstant.spaceWidth10,
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.cartPage);
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(Assets.imageCartOutline),
                  Positioned(
                    top: -15,
                    right: -5,
                    child: Container(
                      alignment: Alignment.center,
                      height: screenHeight * 0.04,
                      width: screenWidth * 0.04,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.redColor,
                      ),
                      child: TextConst(
                        title: '3',
                        fontSize: AppConstant.fontSizeOne,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppConstant.spaceWidth15,
          ],
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: TextFieldConst(
        borderRadius: BorderRadius.circular(5),
        fillColor: AppColor.searchFieldBgColor,
        keyboardType: TextInputType.text,
        maxLength: 35,
        maxLines: 1,
        prefixIcon: Image.asset(
          Assets.iconsSearch,
          scale: 1.9,
          color: AppColor.blueColor,
        ),
        hintColor: Colors.black.withOpacity(.6),
        hint: "Search for medicines & doctors",
        fontSize: AppConstant.fontSizeTwo,
        sufixIcon: Image.asset(
          Assets.iconsMic,
          scale: 1.9,
          color: AppColor.blueColor,
        ),
      ),
    );
  }

  Widget orderOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.orderPrescription);
            },
            child: Container(
              width: screenWidth / 2.2,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        Assets.imageOrderBg,
                      ),
                      fit: BoxFit.fill)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    Assets.imageOrderPBg,
                    width: screenWidth / 6,
                  ),
                  AppConstant.spaceWidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextConst(
                        title: 'Order by\nPrescription',
                        fontSize: AppConstant.fontSizeOne * 1.1,
                        color: AppColor.buttonBlueColor,
                        fontWeight: FontWeight.bold,
                      ),
                      AppConstant.spaceHeight5,
                      Container(
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: AppColor.buttonBlueColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              Assets.iconsOrderPIcons,
                              scale: 3,
                            ),
                            TextConst(
                              title: 'Upload',
                              fontSize: AppConstant.fontSizeOne,
                              color: AppColor.buttonBlueColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.slotPage);
            },
            child: Container(
              width: screenWidth / 2.2,
              padding:
                  const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 7),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        Assets.imageWhatsappBg,
                      ),
                      fit: BoxFit.fill)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppConstant.spaceWidth10,
                  Image.asset(
                    Assets.iconsWhatsappIcon,
                    width: screenWidth / 7.5,
                  ),
                  AppConstant.spaceWidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextConst(
                        title: 'Order by\nWhatsapp',
                        fontSize: AppConstant.fontSizeOne * 1.1,
                        color: AppColor.greenColor,
                        fontWeight: FontWeight.bold,
                      ),
                      AppConstant.spaceHeight5,
                      Container(
                        height: 25,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: AppColor.greenColor)),
                        child: TextConst(
                          title: 'Order',
                          fontSize: AppConstant.fontSizeOne,
                          color: AppColor.greenColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ourOffering() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: TextConst(
            title: 'Our Offerings',
            fontSize: AppConstant.fontSizeThree,
            color: AppColor.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppConstant.spaceHeight10,
        Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            height: screenHeight / 8,
            child: const OfferingsListView()),
      ],
    );
  }

  Widget specialOfferForYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: TextConst(
            fontWeight: FontWeight.w500,
            title: 'Special Offers for You',
            fontSize: AppConstant.fontSizeThree,
            color: AppColor.blackColor,
          ),
        ),
        const OfferSlider(),
      ],
    );
  }

  Widget limitedTimeOffer() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextConst(
                title: 'Limited time deals',
                fontWeight: FontWeight.w500,
                fontSize: AppConstant.fontSizeThree,
                color: AppColor.blackColor,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.medicines);
                },
                child: TextConst(
                  title: 'See all >',
                  fontSize: AppConstant.fontSizeOne,
                  color: AppColor.blueColor,
                ),
              ),
            ],
          ),
        ),
        AppConstant.spaceHeight10,
        SizedBox(height: screenHeight / 3, child: const DealsListView()),
      ],
    );
  }

  Widget shopMedicineByCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: TextConst(
            fontWeight: FontWeight.w500,
            title: 'Shop medicine by category',
            fontSize: AppConstant.fontSizeThree,
            color: AppColor.blackColor,
          ),
        ),
        AppConstant.spaceHeight10,
        Container(
            height: screenHeight / 3,
            alignment: Alignment.center,
            child: const CategoryListView()),
      ],
    );
  }

  Widget bestOffer() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            children: [
              Image.asset(
                Assets.iconsOfferIcon,
                width: 30,
              ),
              AppConstant.spaceWidth5,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConst(
                    fontWeight: FontWeight.w500,
                    title: 'Best Offers',
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.blackColor,
                  ),
                  TextConst(
                    title: 'Explore deals, offers and more',
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              )
            ],
          ),
        ),
        AppConstant.spaceHeight10,
        const OfferSlider(),
      ],
    );
  }

  Widget doctorFromTopCategories() {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.imageTopDoctorBg), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: TextConst(
              textAlign: TextAlign.left,
              title: 'Doctors from top categories',
              fontSize: AppConstant.fontSizeThree,
              color: AppColor.blackColor,
              fontWeight: FontWeight.w500,
            ),
            subtitle: TextConst(
              title: 'Verified doctors in all specialties',
              fontSize: AppConstant.fontSizeOne,
              color: AppColor.textColor,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.normal,
            ),
            trailing: SizedBox(
              height: 34,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: TextConst(
                      textAlign: TextAlign.right,
                      title: 'See all >',
                      fontSize: AppConstant.fontSizeOne,
                      color: AppColor.blueColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppConstant.spaceHeight10,
          SizedBox(height: screenHeight * 0.19, child: const DoctorListView()),
        ],
      ),
    );
  }

  Widget bookAppointmentForTopDoctor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: TextConst(
            title: 'Book appointment to top doctors',
            fontSize: AppConstant.fontSizeThree,
            color: AppColor.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppConstant.spaceHeight10,
        SizedBox(
            height: screenHeight / 2.85, child: const AppointmentListView()),
      ],
    );
  }

  Widget textInfoMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: screenWidth / 2.3,
                child: TextConst(
                  textAlign: TextAlign.start,
                  title:
                      "Don’t self medicate. \nBook appointment in just 30 sec & consult a doctor.",
                  fontSize: AppConstant.fontSizeOne,
                ),
              ),
              SizedBox(
                width: screenWidth / 2.3,
                child: TextConst(
                  textAlign: TextAlign.start,
                  title:
                      "Tired of waiting in line? Just go to the medicine section and buy medicine without going outside.",
                  fontSize: AppConstant.fontSizeOne,
                ),
              ),
            ],
          ),
          AppConstant.spaceHeight15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 6, top: 5, left: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff74B9C8),
                ),
                alignment: Alignment.center,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    alignment: Alignment.bottomRight,
                    image: AssetImage(Assets.imageBookDoctAppo),
                    scale: 4,
                  )),
                  width: screenWidth / 2.4,
                  height: screenWidth / 3.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConst(
                          textAlign: TextAlign.start,
                          title: "Book an appointment with a",
                          maxLines: 1,
                          fontSize: AppConstant.fontSizeOne,
                          color: AppColor.whiteColor),
                      TextConst(
                        title: "DOCTOR",
                        fontWeight: FontWeight.w600,
                        fontSize: AppConstant.fontSizeThree,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 6, top: 5, left: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff32BC93),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: screenWidth / 2.4,
                  height: screenWidth / 3.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.bottomRight,
                          image: AssetImage(
                            Assets.imageDeliveryBoy,
                          ),
                          scale: 4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConst(
                        textAlign: TextAlign.start,
                        title: "Home Delivery in just",
                        fontSize: AppConstant.fontSizeOne,
                        color: AppColor.whiteColor,
                      ),
                      TextConst(
                        textAlign: TextAlign.start,
                        title: "2-3  DAYS",
                        fontWeight: FontWeight.w600,
                        fontSize: AppConstant.fontSizeThree,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget aboutApp() {
    return Container(
      // margin: const EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.only(bottom: 30),
      width: screenWidth,
      decoration:  const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imageBranchOfficeBg), fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppConstant.spaceHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: screenHeight * 0.08,
                width: screenWidth * 0.5,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  Assets.imageAppLogo,
                  width: screenWidth / 2.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.imageHappyCostumer),
                          fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
          AppConstant.spaceHeight15,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: screenWidth,
            child: TextConst(
              textAlign: TextAlign.start,
              title:
                  "Healthcrad.com Is India's most trusted healthcare service provider company from easy doctor appointment to quick ambulance booking to easy path lab support to dispensing quality medicines at affordable prices.",
              fontSize: AppConstant.fontSizeTwo,
              color: AppColor.whiteColor,
            ),
          ),
          AppConstant.spaceHeight15,
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextConst(
              title: "Branch Office",
              fontSize: AppConstant.fontSizeThree,
              fontWeight: FontWeight.w600,
              color: AppColor.whiteColor,
            ),
          ),
          AppConstant.spaceHeight5,
          Padding(
            padding: const EdgeInsets.only(
                left: 13,),
            child: Row(
              children: [
                Image.asset(
                  Assets.iconsLocatinIcon,
                  width: 15,
                ),
                AppConstant.spaceWidth5,
                TextConst(
                  textAlign: TextAlign.start,
                  title: "Purnea, Bihar, India - 854303",
                  fontSize: AppConstant.fontSizeOne,
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommonBooking extends StatelessWidget {
  final String title;
  final String imgBg;
  final String subTitle;
  final String subText;
  final String subImgBg;
  final double? height;
  final double? width;

  const CommonBooking({
    super.key,
    required this.title,
    required this.imgBg,
    required this.subTitle,
    required this.subText,
    required this.subImgBg,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextConst(
                textAlign: TextAlign.start,
                title: title,
                fontSize: AppConstant.fontSizeZero,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              AppConstant.spaceHeight10,
              Container(
                alignment: Alignment.centerRight,
                width: screenWidth * 0.44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(imgBg), fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 6, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextConst(
                        textAlign: TextAlign.start,
                        title: subTitle,
                        fontSize: 10,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                      TextConst(
                        textAlign: TextAlign.start,
                        title: subText,
                        fontSize: AppConstant.fontSizeThree,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 120,
                            width: 100,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(subImgBg),
                                    fit: BoxFit.fitWidth)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
