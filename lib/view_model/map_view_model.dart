// // ignore_for_file: use_build_context_synchronously
//
// import 'dart:async';
// import 'dart:convert';
// import 'dart:ui' as ui;
//
//
// import 'package:health_crad_user/generated/assets.dart';
// import 'package:health_crad_user/res/app_color.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class AuthMapSearch extends StatefulWidget {
//   const AuthMapSearch({super.key});
//
//   @override
//   State<AuthMapSearch> createState() => _AuthMapSearchState();
// }
//
// class _AuthMapSearchState extends State<AuthMapSearch> {
//   String? location;
//   var searchedLocationLatitude;
//   var searchedLocationLongitude;
//   String searchedLocationPincode = "";
//   List<Map<String, dynamic>> _suggestions = [];
//   final Completer<GoogleMapController> _controller = Completer();
//
//   @override
//   Widget build(BuildContext context) {
//     double height = ScreenSize.height(context);
//     double width = ScreenSize.width(context);
//     return Scaffold(
//       backgroundColor: AppColor.greenColor,
//       body: BackgroundPage(
//         text: 'Select your location'.tr,
//         child: Container(
//           height: height * 0.85,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: height * 0.03,
//                 ),
//                 CustomTextField(
//                   onChanged: (v) => _getSuggestions(v),
//                   filled: true,
//                   fillColor: AppColor.greyColor,
//                   prefixIcon: Icon(Icons.search_rounded)
//                 ),
//                 if (_suggestions.isNotEmpty)
//                   ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: _suggestions.length,
//                     itemBuilder: (context, index) {
//                       final suggestion = _suggestions[index];
//                       final location = suggestion['description'];
//                       final placeId = suggestion['place_id'];
//                       final pincode = suggestion['pincode'];
//                       return ListTile(
//                         leading: Image.asset(
//                           Assets.iconsLocatinIcon,
//                           scale: 3,
//                         ),
//                         title: elementsBold(
//                             text: location.toString(),
//                             color: AppColor.greenColor),
//                         subtitle: elements(
//                             text: 'Pin code : $pincode',
//                             color: AppColor.greenColor),
//                         onTap: () async {
//                           FocusScope.of(context).requestFocus(FocusNode());
//                           try {
//                             Map<String, dynamic>? locationDetails =
//                             await getLatLngFromPlaceId(
//                                 placeId, location.toString());
//                             print('Selected Location: $location');
//                             print('Latitude: ${locationDetails['latitude']}');
//                             print('Longitude: ${locationDetails['longitude']}');
//                             print('Pincode: ${locationDetails['pincode']}');
//
//                             Navigator.pop(
//                               context,
//                               {
//                                 'locationName': location,
//                                 'latitude': locationDetails['latitude'],
//                                 'longitude': locationDetails['longitude'],
//                                 'pincode': locationDetails['pincode'],
//                               },
//                             );
//                           } catch (e) {
//                             print('Error retrieving location details: $e');
//                           }
//                         },
//                       );
//                     },
//                   )
//                 else
//                   Center(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: height * 0.05,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.search_rounded),
//                             SizedBox(
//                               width: width * 0.03,
//                             ),
//                             titleBold(
//                                 text: 'No suggestions'.tr,
//                                 color: AppColor.darkGreen),
//                           ],
//                         ),
//                       ],
//                     ),
//                     //  Text('No suggestions'),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _getSuggestions(String input) async {
//     const apiKey = MapApi.mapKey;
//     final endpoint = Uri.parse(
//         '${MapApi.mapSuggetion}$input&key=$apiKey&language=en&region=in');
//
//     final response = await http.get(endpoint);
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       print('API Response: $data'); // Print API response for debugging
//       final predictions = data['predictions'];
//       List<Map<String, dynamic>> tempSuggestions = [];
//       for (var prediction in predictions) {
//         final description = prediction['description'] as String;
//         final placeId = prediction['place_id'] as String;
//         final pincode = await getPincodeFromPlaceId(placeId);
//         tempSuggestions.add({
//           'description': description,
//           'place_id': placeId,
//           'pincode': pincode,
//         });
//       }
//       setState(() {
//         _suggestions = tempSuggestions;
//       });
//     } else {
//       // Handle API error
//       print('Failed to fetch suggestions: ${response.statusCode}');
//     }
//   }
//
//   Future<String> getPincodeFromPlaceId(String placeId) async {
//     const apiKey = MapApi.mapKey;
//     final response = await http
//         .get(Uri.parse('${MapApi.mapGetLatLong}$placeId&key=$apiKey'));
//
//     if (response.statusCode == 200) {
//       final decodedResponse = json.decode(response.body);
//       if (decodedResponse['status'] == 'OK') {
//         final addressComponents = decodedResponse['result']['address_components'];
//         String pincode = "";
//         for (var component in addressComponents) {
//           if (component['types'].contains('postal_code')) {
//             pincode = component['long_name'];
//             break;
//           }
//         }
//         return pincode;
//       } else {
//         throw Exception(
//             'Failed to fetch location details: ${decodedResponse['error_message']}');
//       }
//     } else {
//       throw Exception(
//           'Failed to fetch location details: ${response.statusCode}');
//     }
//   }
//
//   Future<Map<String, dynamic>> getLatLngFromPlaceId(String placeId, String address) async {
//     const apiKey = MapApi.mapKey;
//     final response = await http
//         .get(Uri.parse('${MapApi.mapGetLatLong}$placeId&key=$apiKey'));
//
//     if (response.statusCode == 200) {
//       final decodedResponse = json.decode(response.body);
//       if (decodedResponse['status'] == 'OK') {
//         final location = decodedResponse['result']['geometry']['location'];
//         searchedLocationLatitude = location['lat'];
//         searchedLocationLongitude = location['lng'];
//         final addressComponents = decodedResponse['result']['address_components'];
//
//         String pincode = "";
//         for (var component in addressComponents) {
//           if (component['types'].contains('postal_code')) {
//             pincode = component['long_name'];
//             break;
//           }
//         }
//
//         _suggestions.clear();
//         final searchlatlan = LatLng(searchedLocationLatitude, searchedLocationLongitude);
//         _gotoSpecificPosition(searchlatlan);
//
//         return {
//           'latitude': searchedLocationLatitude,
//           'longitude': searchedLocationLongitude,
//           'pincode': pincode,
//         };
//       } else {
//         throw Exception(
//             'Failed to fetch location details: ${decodedResponse['error_message']}');
//       }
//     } else {
//       throw Exception(
//           'Failed to fetch location details: ${response.statusCode}');
//     }
//   }
//
//   Future<void> _gotoSpecificPosition(LatLng position) async {
//     GoogleMapController mapController = await _controller.future;
//     mapController.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(target: position, zoom: 13.5)));
//   }
//
//   Future<Uint8List> getImages(String path, int width) async {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//         targetHeight: width);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
//         .buffer
//         .asUint8List();
//   }
// }