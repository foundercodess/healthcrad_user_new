// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:health_crad_user/main.dart';
// import 'package:health_crad_user/res/app_btn.dart';
// import 'package:health_crad_user/res/app_color.dart';
// import 'package:health_crad_user/res/app_constant.dart';
// import 'package:health_crad_user/res/text_const.dart';
// import 'package:health_crad_user/view_model/map_view_model.dart';
// import 'package:provider/provider.dart';
//
// class MapPage extends StatefulWidget {
//   const MapPage({
//     super.key,
//   });
//
//   @override
//   State<MapPage> createState() => _MapPageState();
// }
//
//
// class _MapPageState extends State<MapPage> {
//   TextEditingController searchCon =
//       TextEditingController(); // Search contr
//   // oller
//   int markerIdCounter = 0;
//   String selectedLocation = "";
//
//   double latData = 0.0;
//   double lngData = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {});
//     final mapViewModel = Provider.of<MapViewModel>(context, listen: false);
//     mapViewModel.checkAndRequestPermission(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Consumer<MapViewModel>(
//         builder: (context, mCon, child) {
//           return Scaffold(
//             backgroundColor: AppColor.whiteColor,
//             body: Stack(
//               children: [
//                 // The Google Map
//                 Positioned.fill(
//                   child: GoogleMap(
//                     zoomControlsEnabled: false,
//                     zoomGesturesEnabled: true,
//                     myLocationButtonEnabled: false,
//                     myLocationEnabled: true,
//                     mapType: MapType.normal,
//                     initialCameraPosition: mCon.initialCameraPosition,
//                     markers: mCon.markers,
//                     polylines: mCon.polyLines,
//                     onMapCreated: (GoogleMapController controller) {
//                       if (!mCon.completer.isCompleted) {
//                         mCon.completer.complete(controller);
//                       }
//                       // mCon.changeCameraPosition(mCon.lat, mCon.lng);
//                     },
//                   ),
//                 ),
//                 // The Search Bar positioned at the top
//                 Positioned(
//                   top: 10,
//                   left: 10,
//                   right: 10,
//                   child: buildSearchBar(mCon),
//                 ),
//                 // The BottomSheetContent positioned at the bottom
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: BottomSheetContent(selectedLocation: selectedLocation,),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//
//   Widget buildSearchBar(MapViewModel mCon) {
//     return Column(
//       children: [
//         Container(
//           width: screenWidth,
//           decoration: BoxDecoration(
//             color: AppColor.whiteColor,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.shade300,
//                 spreadRadius: 0.5,
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               )
//             ],
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: TextField(
//             controller: searchCon,
//             cursorColor: AppColor.primaryColor,
//             cursorOpacityAnimates: true,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.all(0),
//               filled: true,
//               fillColor: AppColor.whiteColor,
//               hintText: 'Search',
//               counterText: "",
//               hintStyle: TextStyle(
//                 fontFamily: 'poppins',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 15,
//                 color: AppColor.textColor,
//               ),
//               prefixIcon: const Icon(
//                 Icons.search_rounded,
//                 color: Colors.blue,
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: AppColor.buttonBlueColor,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: AppColor.buttonBlueColor,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: AppColor.buttonBlueColor,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               disabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: AppColor.buttonBlueColor,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//             ),
//             onChanged: (val) {
//               mCon.placeSearchApi(val);
//             },
//           ),
//         ),
//         const SizedBox(height: 5),
//         searchCon.text.isNotEmpty
//             ? Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Container(
//                   width: screenWidth,
//                   padding: const EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: ListView.builder(
//                     itemCount: mCon.placeList.length,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () async {
//                           final placeId = mCon.placeList[index]['place_id'];
//                           try {
//                             Map<String, dynamic> location =
//                                 await mCon.getPlaceDetails(placeId);
//                             double lat = location['lat'];
//                             double lng = location['lng'];
//                             // mCon.setLatLng(lat, lng);
//                             searchCon.text =
//                                 mCon.placeList[index]["description"].toString();
//                             setState(() {
//                               selectedLocation = mCon.placeList[index]
//                                       ["description"]
//                                   .toString();
//                               latData=lat;
//                               lngData=lng;
//                               mCon.placeList.clear();
//                               searchCon.clear();
//                             });
//                           } catch (e) {
//                             if (kDebugMode) {
//                               print('Error fetching place details: $e');
//                             }
//                           }
//                         },
//                         child: Column(
//                           children: [
//                             SizedBox(height: screenHeight * 0.008),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.place,
//                                   color: AppColor.blackColor,
//                                 ),
//                                 const SizedBox(width: 3),
//                                 SizedBox(
//                                   width: screenWidth * 0.7,
//                                   child: TextConst(
//                                     title: mCon.placeList[index]["description"],
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.blackColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: screenHeight * 0.01),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: List.generate(35, (index) {
//                                 return Container(
//                                   padding:
//                                       const EdgeInsets.symmetric(horizontal: 2),
//                                   height: 1,
//                                   width: 6,
//                                   color: AppColor.textColor,
//                                 );
//                               }),
//                             ),
//                             SizedBox(height: screenHeight * 0.008),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               )
//             : Container(),
//       ],
//     );
//   }
//
//   Widget bottomSheet(){
//     final mapCon= Provider.of<MapViewModel>(context);
//     Map arguments =
//     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         color: AppColor.whiteColor,
//         width: screenWidth,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             TextConst(
//               maxLines: 4,
//               title: selectedLocation.isNotEmpty
//                   ? selectedLocation
//                   : 'Selected Location',
//               color: AppColor.blackColor,
//               fontSize: AppConstant.fontSizeThree,
//             ),
//             AppConstant.spaceHeight10,
//             ButtonConst(
//               height: screenHeight * 0.05,
//               onTap: () {
//                 // Pop the current page and send back the selectedLocation
//                 if(arguments["navType"]=="src"){
//                   mapCon.setPickupLatLng(mapCon.latSrc, mapCon.lngSrc);
//                 }else if (arguments["navType"]=="des"){
//                   mapCon.setDestinationLatLng(mapCon.latSrc, mapCon.lngSrc);
//                 }
//                 Navigator.pop(context, {
//                   "location":
//                   selectedLocation.isNotEmpty
//                       ? selectedLocation
//                       : 'No Location Selected',
//                 });
//               },
//               label: 'Pick Location',
//               textColor: AppColor.whiteColor,
//               fontSize: AppConstant.fontSizeThree,
//               color: AppColor.primaryColor,
//             ),
//           ],
//         )
//
//     );
//   }
// }
//
//


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_btn.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/view_model/map_view_model.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}


class _MapPageState extends State<MapPage> {
  TextEditingController searchCon =
  TextEditingController();

  int markerIdCounter = 0;
  String selectedLocation = "";

  double latData = 0.0;
  double lngData = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    final mapViewModel = Provider.of<MapViewModel>(context, listen: false);
    mapViewModel.checkAndRequestPermission(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<MapViewModel>(
        builder: (context, mCon, child) {
          return Scaffold(
            backgroundColor: AppColor.whiteColor,
            body: Stack(
              children: [
                // The Google Map
                Positioned.fill(
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: mCon.initialCameraPosition,
                    markers: mCon.markers,
                    polylines: mCon.polyLines,
                    onMapCreated: (GoogleMapController controller) {
                      if (!mCon.completer.isCompleted) {
                        mCon.completer.complete(controller);
                      }
                      // mCon.changeCameraPosition(mCon.lat, mCon.lng);
                    },
                  ),
                ),
                // The Search Bar positioned at the top
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: buildSearchBar(mCon),
                ),
                // The BottomSheetContent positioned at the bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: bottomSheet(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget buildSearchBar(MapViewModel mCon) {
    Map arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final mapCon= Provider.of<MapViewModel>(context);

    return Column(
      children: [
        Container(
          width: screenWidth,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 0.5,
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: searchCon,
            cursorColor: AppColor.primaryColor,
            cursorOpacityAnimates: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              filled: true,
              fillColor: AppColor.whiteColor,
              hintText: 'Search',
              counterText: "",
              hintStyle: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: AppColor.textColor,
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Colors.blue,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.buttonBlueColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.buttonBlueColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.buttonBlueColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.buttonBlueColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onChanged: (val) {
              mCon.placeSearchApi(val);
            },
          ),
        ),
        const SizedBox(height: 5),
        searchCon.text.isNotEmpty
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: screenWidth,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              itemCount: mCon.placeList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    final placeId = mCon.placeList[index]['place_id'];
                    try {
                      Map<String, dynamic> location =
                      await mCon.getPlaceDetails(placeId);
                      double lat = location['lat'];
                      double lng = location['lng'];
                      setState(() {
                        selectedLocation = mCon.placeList[index]
                        ["description"]
                            .toString();
                      });
                      if(arguments["navType"]=="src"){
                        mapCon.setPickupLatLng(lat,lng);

                      }else if (arguments["navType"]=="des"){
                        mapCon.setDestinationLatLng(lat, lng);
                      }else{
                      }
                      searchCon.text =
                          selectedLocation;

                    } catch (e) {
                      if (kDebugMode) {
                        print('Error fetching place details: $e');
                      }
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.008),
                      Row(
                        children: [
                          Icon(
                            Icons.place,
                            color: AppColor.blackColor,
                          ),
                          const SizedBox(width: 3),
                          SizedBox(
                            width: screenWidth * 0.7,
                            child: TextConst(
                              title: mCon.placeList[index]["description"],
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(35, (index) {
                          return Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 2),
                            height: 1,
                            width: 6,
                            color: AppColor.textColor,
                          );
                        }),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                    ],
                  ),
                );
              },
            ),
          ),
        )
            : Container(),
      ],
    );
  }

  Widget bottomSheet(){
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: AppColor.whiteColor,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextConst(
              maxLines: 4,
              title: selectedLocation.isNotEmpty
                  ? selectedLocation
                  : 'Selected Location',
              color: AppColor.blackColor,
              fontSize: AppConstant.fontSizeThree,
            ),
            AppConstant.spaceHeight10,
            ButtonConst(
              height: screenHeight * 0.05,
              onTap: () {
                Navigator.pop(context,
                  selectedLocation.isNotEmpty
                      ? selectedLocation
                      : 'No Location Selected',
                );
              },
              label: 'Pick Location',
              textColor: AppColor.whiteColor,
              fontSize: AppConstant.fontSizeThree,
              color: AppColor.primaryColor,
            ),
          ],
        )

    );
  }
}


