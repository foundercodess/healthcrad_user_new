import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/custom_text_field.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/ambulance_view_model.dart';
import 'package:health_crad_user/view_model/map_view_model.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class AmbulancePage extends StatefulWidget {
  const AmbulancePage({super.key});

  @override
  State<AmbulancePage> createState() => _AmbulancePageState();
}

class _AmbulancePageState extends State<AmbulancePage> {
  int _selectedIndex = 0;
  int _selectedIndex1 = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AmbulanceViewModel>(context, listen: false)
          .ambulanceTypeApi(context);
      final mapViewModel = Provider.of<MapViewModel>(context, listen: false);
      mapViewModel.clearFunction();
    });
  }

  final TextEditingController startLocationCon = TextEditingController();
  final TextEditingController destinationLocationCon = TextEditingController();
  final TextEditingController patientNameCon = TextEditingController();
  final TextEditingController patientPhoneCon = TextEditingController();

  double srcLat = 0.0;
  double srcLng = 0.0;

  @override
  Widget build(BuildContext context) {
    final ambulanceViewModel = Provider.of<AmbulanceViewModel>(context);
    final mapViewModel = Provider.of<MapViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: AppColor.whiteColor,
            border:
                Border(top: BorderSide(color: AppColor.greyColor, width: 0.5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: screenWidth,
                color: AppColor.whiteColor,
                child: Image.asset(
                  Assets.imageAmbuTextBg,
                  scale: 4,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  int.parse((screenWidth / 8).toStringAsFixed(0)),
                  (i) => TextConst(
                    title: '-',
                    fontSize: AppConstant.fontSizeZero,
                    color: AppColor.textColor.withOpacity(0.3),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AppConstant.spaceHeight5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextConst(
                        title: 'Distance: ',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      TextConst(
                        title: '250 Km',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.blackColor,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (startLocationCon.text.isEmpty) {
                        Utils.show("Please Enter Pickup Location", context);
                      } else if (destinationLocationCon.text.isEmpty) {
                        Utils.show("Please Enter Drop Location", context);
                      } else if (patientNameCon.text.isEmpty) {
                        Utils.show("Please Enter Patient Name", context);
                      } else if (patientPhoneCon.text.isEmpty) {
                        Utils.show("Please Enter Valid Phone Number", context);
                      } else {
                        UserViewModel userViewModel = UserViewModel();
                        String? userId = await userViewModel.getUser();
                        Map data = {
                          "address": startLocationCon.text,
                          "distance":
                              "${(mapViewModel.distance / 1000).toStringAsFixed(2)}Km",
                          "username": patientNameCon.text,
                          "phone": patientPhoneCon.text,
                          "originlatitude": mapViewModel.latSrc,
                          "originlongitude": mapViewModel.latDes,
                          "destinationlatitude": mapViewModel.latDes,
                          "destinationlogitude": mapViewModel.lngDes,
                          "pickup_address": startLocationCon.text,
                          "drop_address": destinationLocationCon.text,
                          "ambulance_type": ambulanceViewModel
                              .ambulanceTypeData!.data?[_selectedIndex].id
                              .toString(),
                          "user_id": userId,
                        };
                        ambulanceViewModel.setReqData(context, data);
                        print(jsonEncode(data));
                      }
                    },
                    child: Container(
                      height: screenHeight * 0.045,
                      width: screenWidth * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.buttonBgColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextConst(
                            title: ' Proceed to next',
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                          Image.asset(
                            Assets.iconsIconsArrowRight,
                            scale: 3,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.2,
        backgroundColor: AppColor.primaryColor,
        leadingWidth: screenWidth,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  Assets.iconsArrowBack,
                  color: AppColor.whiteColor,
                  scale: 3,
                ),
              ),
              AppConstant.spaceWidth10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextConst(
                    title: 'Ambulance',
                    fontSize: AppConstant.fontSizeThree,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  TextConst(
                    title: 'Book your ride with HealthCRAD !',
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppConstant.spaceHeight10,
            Container(
              color: AppColor.whiteColor,
              width: screenWidth,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.11,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1, color: AppColor.blackColor)),
                          ),
                          Container(
                            height: 30,
                            width: 2,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      Assets.imageLineBg,
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          Image.asset(
                            Assets.pngLocatinIcon,
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Column(
                        children: [
                          TextFieldConst(
                            onTap: () async {
                              final selectedLocation =
                                  await Navigator.pushNamed(
                                      context, RoutesName.mapPage,
                                      arguments: {"navType": "src"});
                              if (selectedLocation != null) {
                                startLocationCon.text =
                                    selectedLocation.toString();
                              }
                            },
                            maxLines: 1,
                            enabled: false,
                            controller: startLocationCon,
                            width: screenWidth * 0.7,
                            keyboardType: TextInputType.text,
                            hint: "Choose start location",
                            fontSize: AppConstant.fontSizeTwo,
                            filled: true,
                            fillColor: AppColor.whiteColor,
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColor.textColor.withOpacity(0.2)),
                          ),
                          AppConstant.spaceHeight10,
                          TextFieldConst(
                            onTap: () async {
                              final selectedDestination =
                                  await Navigator.pushNamed(
                                      context, RoutesName.mapPage,
                                      arguments: {"navType": "des"});
                              if (selectedDestination != null) {
                                destinationLocationCon.text =
                                    selectedDestination.toString();
                              }
                            },
                            enabled: false,
                            maxLines: 1,
                            controller: destinationLocationCon,
                            width: screenWidth * 0.7,
                            keyboardType: TextInputType.text,
                            hint: "To your destination",
                            fontSize: AppConstant.fontSizeTwo,
                            filled: true,
                            fillColor: AppColor.whiteColor,
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColor.textColor.withOpacity(0.2)),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      Assets.iconsAmbuArrowDown,
                      scale: 1.9,
                    )
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              color: AppColor.whiteColor,
              width: screenWidth,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Column(
                    children: [
                      TextConst(
                        title: 'Choose Ambulance Type',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                      AppConstant.spaceHeight20,
                      Container(
                        height: screenHeight * 0.2,
                        width: screenWidth,
                        color: Colors.white,
                        child: ambulanceViewModel.ambulanceTypeData == null
                            ? const Center(child: CircularProgressIndicator())
                            : GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 30.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 2.4),
                                itemCount: ambulanceViewModel
                                    .ambulanceTypeData!.data!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          width: 1,
                                          color: _selectedIndex == index
                                              ? AppColor.primaryColor
                                                  .withOpacity(0.3)
                                              : AppColor.textColor
                                                  .withOpacity(0.3),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: screenHeight * 0.06,
                                            width: screenWidth * 0.25,
                                            alignment: Alignment.centerLeft,
                                            child: TextConst(
                                              textAlign: TextAlign.start,
                                              title: ambulanceViewModel
                                                  .ambulanceTypeData!
                                                  .data?[index]
                                                  .type
                                                  .toString(),
                                              fontSize: AppConstant.fontSizeTwo,
                                              color: AppColor.textColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // Showing the dialog box on tap
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        AppColor.whiteColor,
                                                    title: Text(
                                                        "${ambulanceViewModel.ambulanceTypeData!.data?[index].type.toString()}"),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: ListBody(
                                                        children: [
                                                          Text(
                                                              "${ambulanceViewModel.ambulanceTypeData!.data?[index].description.toString()}"),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        child: Text('OK'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(); // Close the dialog
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );

                                              // Handling selection logic
                                              setState(() {
                                                _selectedIndex1 = index;
                                              });
                                            },
                                            child: Image.asset(
                                              Assets.iconsTypeIcon,
                                              height: 15,
                                              width: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  )),
            ),
            AppConstant.spaceHeight10,
            Container(
              width: screenWidth,
              color: AppColor.whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: CustomRichText(textSpans: [
                  CustomTextSpan(
                      text: "Total Distance : ",
                      textColor: AppColor.blackColor,
                      fontSize: AppConstant.fontSizeTwo,
                      fontWeight: FontWeight.w600),
                  // CustomTextSpan(
                  //     // text: "250 Km",
                  //     text: mapViewModel.calculateDistance().toString(),
                  //     textColor: AppColor.textColor,
                  //     fontSize: AppConstant.fontSizeTwo)
                  CustomTextSpan(
                    text:
                        "${(mapViewModel.distance / 1000).toStringAsFixed(2)} Km", // Displaying in kilometers
                    textColor: AppColor.textColor,
                    fontSize: AppConstant.fontSizeTwo,
                  ),
                ]),
              ),
            ),
            AppConstant.spaceHeight10,
            Container(
              color: AppColor.whiteColor,
              width: screenWidth,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextConst(
                          title: 'Fill the patient details :',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        AppConstant.spaceHeight15,
                        TextFieldConst(
                          fillColor: AppColor.whiteColor,
                          filled: true,
                          width: screenWidth * 0.9,
                          keyboardType: TextInputType.text,
                          controller: patientNameCon,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 12),
                            child: Image.asset(
                              Assets.iconsName,
                              height: 25,
                              width: 25,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          hint: "Patient name",
                          fontSize: AppConstant.fontSizeTwo,
                          borderSide: BorderSide(
                              width: 1,
                              color: AppColor.textColor.withOpacity(0.2)),
                        ),
                        AppConstant.spaceHeight10,
                        TextFieldConst(
                          fillColor: AppColor.whiteColor,
                          filled: true,
                          width: screenWidth * 0.9,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          controller: patientPhoneCon,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 12),
                            child: Image.asset(
                              Assets.iconsGreenCallIcon,
                              height: 25,
                              width: 25,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          hint: "Phone number",
                          fontSize: AppConstant.fontSizeTwo,
                          borderSide: BorderSide(
                              width: 1,
                              color: AppColor.textColor.withOpacity(0.2)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AppConstant.spaceHeight10,
            AppConstant.spaceHeight5,
          ],
        ),
      ),
    );
  }
}
