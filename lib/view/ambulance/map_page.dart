// import 'dart:async';
// import 'dart:convert';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:health_crad_user/generated/assets.dart';
// import 'package:health_crad_user/main.dart';
// import 'package:health_crad_user/res/app_color.dart';
// import 'package:health_crad_user/view_model/map_view_model.dart';
//
// import 'package:http/http.dart' as http;
//
//
// class MapView extends StatefulWidget {
//   const MapView({super.key});
//
//   @override
//   State<MapView> createState() => _MapViewState();
// }
//
// class _MapViewState extends State<MapView> {
//   String radius = "30";
//   double latitude = 31.5111093;
//   double longitude = 74.279664;
//   String lat = "0.000";
//   String long = "0.000";
//
//   final Completer<GoogleMapController> _controller = Completer();
//   String _currentAddress = "";
//   String _currentDistrict = ""; // New variable to store district name
//   String _currentPincode = ""; // New variable to store pincode
//   CameraPosition? _cameraPosition;
//   late LatLng _defaultLatLng;
//   late LatLng _draggedLatlng;
//   Uint8List? marketImages;
//   final List<Marker> _markers = [];
//   var suggestedLocationName;
//   var suggestedLocationLat;
//   var suggestedLocationLong;
//
//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }
//
//   void _init() {
//     _defaultLatLng = const LatLng(20.5937, 78.9629);
//     _draggedLatlng = _defaultLatLng;
//     _cameraPosition = CameraPosition(target: _defaultLatLng, zoom: 10.5);
//     _gotoUserCurrentPosition();
//   }
//
//   Future<Uint8List> getImages(String path, int width) async {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
//         targetHeight: width);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     Uint8List imageData = (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
//     print("Image loaded: ${imageData.lengthInBytes} bytes");
//     return imageData;
//   }
//
//   Future<void> _gotoUserCurrentPosition() async {
//     Position currentPosition = await _determineUserCurrentPosition();
//     _gotoSpecificPosition(
//         LatLng(currentPosition.latitude, currentPosition.longitude));
//     final Uint8List locationIcon = await getImages(Assets.pngLocatinIcon, 70);
//     setState(() {
//       lat = currentPosition.latitude.toString();
//       long = currentPosition.longitude.toString();
//       _markers.add(Marker(
//         markerId: const MarkerId('0'),
//         icon: BitmapDescriptor.fromBytes(locationIcon),
//         position: LatLng(currentPosition.latitude, currentPosition.longitude),
//         infoWindow: const InfoWindow(title: "Your Location"),
//         draggable: true,
//       ));
//     });
//   }
//
//   Future<void> _gotoSpecificPosition(LatLng position) async {
//     GoogleMapController mapController = await _controller.future;
//     mapController.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(target: position, zoom: 13.5)));
//     await _getAddress(position);
//   }
//
//   // Future<void> _getAddress(LatLng position) async {
//   //   List<Placemark> placemarks =
//   //   await placemarkFromCoordinates(position.latitude, position.longitude);
//   //   print("place marks ${placemarks.join("{}")}");
//   //   Placemark address = placemarks[0];
//   //   print("hii ashu ${address}");
//   //   String addressStr =
//   //       "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";
//   //   String districtName = address.locality ?? "Unknown District"; // Extract district name
//   //   String pincode = address.postalCode ?? "Unknown Pincode"; // Extract pincode
//   //   setState(() {
//   //     _currentAddress = addressStr;
//   //     _currentDistrict = districtName; // Update state with district name
//   //     _currentPincode = pincode; // Update state with pincode
//   //   });
//   // }
//
//   Future<void> _getAddress(LatLng position) async {
//     final apiKey = MapApi.mapKey;
//     final url =
//         'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey';
//
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data['results'].isNotEmpty) {
//         var result = data['results'][0];
//         String districtName = '';
//         String pincode = '';
//         print(data['results'][0]);
//         print("formatted address here ${result['formatted_address']}");
//         String formattedAddress = result['formatted_address'];
//
//         for (var component in result['address_components']) {
//
//           if (component['types'].contains('administrative_area_level_3')) {
//             print("my component: $component");
//             // Extract district (administrative_area_level_2 typically refers to the district)
//             districtName = component['long_name'];
//           }
//           if (component['types'].contains('postal_code')) {
//             // Extract pincode
//             pincode = component['long_name'];
//           }
//         }
//
//         setState(() {
//           _currentDistrict = districtName.isNotEmpty ? districtName : "Unknown District";
//           _currentPincode = pincode.isNotEmpty ? pincode : "Unknown Pincode";
//           _currentAddress = formattedAddress;
//         });
//       }
//     } else {
//       print("Failed to get address from Google API");
//     }
//   }
//
//   Future<Position> _determineUserCurrentPosition() async {
//     LocationPermission locationPermission;
//     bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isLocationServiceEnabled) {
//       print("User hasn't enabled location services.");
//     }
//     locationPermission = await Geolocator.checkPermission();
//     if (locationPermission == LocationPermission.denied) {
//       locationPermission = await Geolocator.requestPermission();
//       if (locationPermission == LocationPermission.denied) {
//         print("User denied location permissions.");
//       }
//     }
//     if (locationPermission == LocationPermission.deniedForever) {
//       print("User denied location permissions permanently.");
//     }
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.best);
//   }
//
//   Future<void> _selectLocation() async {
//     final selectedLocation = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const AuthMapSearch()),
//     );
//     if (selectedLocation != null && selectedLocation is Map<String, dynamic>) {
//       setState(() {
//         suggestedLocationName = selectedLocation['locationName'];
//         suggestedLocationLat = selectedLocation['latitude'];
//         suggestedLocationLong = selectedLocation['longitude'];
//         _gotoSpecificPosition(
//             LatLng(suggestedLocationLat, suggestedLocationLong));
//         _markers.clear();
//         getImages(Assets.pngLocatinIcon, 70).then((locationIcon) {
//           setState(() {
//             print("Adding custom marker at: $suggestedLocationLat, $suggestedLocationLong");
//             _markers.add(Marker(
//               markerId: const MarkerId('0'),
//               icon: BitmapDescriptor.fromBytes(locationIcon),
//               position: LatLng(suggestedLocationLat, suggestedLocationLong),
//               infoWindow: InfoWindow(title: suggestedLocationName),
//               draggable: true,
//             ));
//             _draggedLatlng =
//                 LatLng(suggestedLocationLat, suggestedLocationLong);
//             _currentAddress = suggestedLocationName;
//           });
//         });
//       });
//     }
//   }
//
//   void _handleTap(LatLng tappedPoint) async {
//     final Uint8List locationIcon = await getImages(Assets.pngLocatinIcon, 70);
//     setState(() {
//       _markers.clear();
//       _markers.add(Marker(
//         markerId: const MarkerId('tappedPoint'),
//         position: tappedPoint,
//         icon: BitmapDescriptor.fromBytes(locationIcon),
//         infoWindow: const InfoWindow(title: "Selected Location"), // Set InfoWindow title
//       ));
//       _draggedLatlng = tappedPoint;
//     });
//     _gotoSpecificPosition(tappedPoint);
//   }
//
//   Widget _buildBody() {
//     ScreenSize.height(context);
//
//     return Stack(
//       children: [
//         _getMap(),
//         _getLocationButton(),
//       ],
//     );
//   }
//
//   Widget _getMap() {
//     return ClipRRect(
//       borderRadius: const BorderRadius.only(
//         topLeft: Radius.circular(20.0),
//         topRight: Radius.circular(20.0),
//       ),
//       child: GoogleMap(
//         myLocationEnabled: true,
//         zoomControlsEnabled: false,
//         zoomGesturesEnabled: true,
//         myLocationButtonEnabled: true,
//         markers: Set<Marker>.of(_markers),
//         initialCameraPosition: _cameraPosition!,
//         mapType: MapType.terrain,
//         onCameraIdle: () {
//           _getAddress(_draggedLatlng);
//         },
//         onCameraMove: (cameraPosition) {
//           _draggedLatlng = cameraPosition.target;
//         },
//         onTap: _handleTap, // Handle tap events
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//     );
//   }
//
//   Widget _getLocationButton() {
//     double width = ScreenSize.width(context);
//     double height = ScreenSize.height(context);
//
//
//     return Positioned(
//       bottom: height * 0.1,
//       right: width * 0.2,
//       child: InkWell(
//         onTap: _gotoUserCurrentPosition,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
//           decoration: BoxDecoration(
//             color: Colors.green.withOpacity(0.7),
//             borderRadius: BorderRadius.circular(8.0),
//             border: Border.all(width: 1.2, color: Colors.black),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Image.asset(Assets.pngLocatinIcon,
//                   color: AppColor.whiteColor, scale: 3),
//               SizedBox(width: width * 0.02),
//               titleBold(text: 'Use current location'.tr, color: AppColor.white),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget bottomWidget() {
//     double width = ScreenSize.width(context);
//     double height = ScreenSize.height(context);
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           InkWell(
//             onTap: _selectLocation,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset(Assets.pngLocatinIcon, scale: 2.5),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: width * 0.7,
//                       child: elementsBold(
//                           text: _currentAddress, color: AppColor.darkGreen),
//                     ),
//                     SizedBox(
//                       width: width * 0.7,
//                       child: elementsBold(
//                           text: '$_currentDistrict , $_currentPincode', color: AppColor.darkGreen),
//                     ),
//                   ],
//                 ),
//                  Icon(Icons.edit, color: AppColor.greenColor),
//               ],
//             ),
//           ),
//           SizedBox(height: height * 0.02),
//           AppBtn(
//             title: 'Confirm location'.tr,
//             onTap: () {
//               Navigator.pop(context, {
//                 'locationName': _currentAddress,
//                 'districtName': _currentDistrict, // Pass district name
//                 'pincode': _currentPincode, // Pass pincode
//                 'latitude': _draggedLatlng.latitude.toString(),
//                 'longitude': _draggedLatlng.longitude.toString(),
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ScreenSize.width(context);
//     return Scaffold(
//       backgroundColor: AppColor.greenColor,
//       appBar: AppBar(
//         backgroundColor: AppColor.greenColor,
//         leading: const AppBackBtn(),
//         title: titleBold(text: 'Select your location'.tr, color: AppColor.white),
//         toolbarHeight: 90,
//       ),
//       bottomNavigationBar: bottomWidget(),
//       body: Center(child: _buildBody()),
//     );
//   }
// }