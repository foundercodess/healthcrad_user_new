// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
//
// class MapViewModel with ChangeNotifier {
//   final CameraPosition initialCameraPosition = const CameraPosition(
//     target: LatLng(26.9157806819305, 80.9580939971136),
//     zoom: 14,
//   );
//
//   final Completer<GoogleMapController> completer =
//       Completer<GoogleMapController>();
//
//   final Set<Marker> markers = {};
//
//   List<dynamic> _placeList = [];
//   List<dynamic> get placeList => _placeList;
//   void setPlaceData(List<dynamic> val) {
//     _placeList = val;
//     notifyListeners();
//   }
//   //add marker
//
//   void addMarker(double latitude, double longitude, String markerId) {
//     markers.remove("marker_$markerId");
//     markers.add(Marker(
//       markerId: MarkerId('marker_$markerId'),
//       position: LatLng(latitude, longitude),
//       infoWindow: const InfoWindow(title: 'Selected Location'),
//     ));
//     changeCameraPosition(latitude, longitude);
//     notifyListeners();
//   }
//
//   //find lat lng using search place
//
//   double _latSrc = 0.0;
//   double _lngSrc = 0.0;
//   double _latDes = 0.0;
//   double _lngDes = 0.0;
//
//   double get latSrc => _latSrc;
//   double get lngSrc => _lngSrc;
//   double get latDes => _latDes;
//   double get lngDes => _lngDes;
//
//   void setPickupLatLng(double lat, double lng) {
//     _latSrc = lat;
//     _lngSrc = lng;
//     _searchedLocation = LatLng(lat, lng);
//     addMarker(_latSrc, _lngSrc, "searched Pickup location");
//     _placeList.clear();
//     notifyListeners();
//   }
//
//   void setDestinationLatLng(double lat, double lng) {
//     _latDes = lat;
//     _lngDes = lng;
//     _searchedLocation = LatLng(lat, lng);
//     addMarker(_latDes, _lngDes, "searched Drop location");
//     _placeList.clear();
//     notifyListeners();
//   }
//
//
// //search location api
//   Future<void> placeSearchApi(dynamic searchCon) async {
//     Uri uri =
//         Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
//       "input": searchCon,
//       "key": "AIzaSyDpn7sjPxjUUi7tgAKpPHUjplrANUYNov8",
//       "components": "country:in",
//     });
//     var response = await http.get(uri);
//     if (response.statusCode == 200) {
//       if (kDebugMode) {
//         print(response.body);
//       }
//       final resData = jsonDecode(response.body)['predictions'];
//       if (resData != null) {
//         setPlaceData(resData);
//       }
//     } else {
//       if (kDebugMode) {
//         print('Error fetching suggestions: ${response.body}');
//       }
//     }
//   }
//
//   //search place details
//
//   Future<dynamic> getPlaceDetails(String placeId) async {
//     var res = await http.get(
//       Uri.parse(
//           'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=AIzaSyDpn7sjPxjUUi7tgAKpPHUjplrANUYNov8'),
//     );
//     if (kDebugMode) {
//       print(res.body);
//     }
//     if (res.statusCode == 200) {
//       final resData = jsonDecode(res.body)['result']['geometry']['location'];
//       if (kDebugMode) {
//         print("resData");
//       }
//       if (kDebugMode) {
//         print(resData);
//       }
//       return resData;
//     } else {}
//   }
//
//   Future<void> changeCameraPosition(double lat, double lng) async {
//     final GoogleMapController controller = await completer.future;
//     CameraPosition givenLocation = CameraPosition(
//       target: LatLng(lat, lng),
//       zoom: 14,
//     );
//     controller.animateCamera(CameraUpdate.newCameraPosition(givenLocation));
//   }
//
//   Future<void> checkAndRequestPermission(context) async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.deniedForever) {
//         _showPermissionDeniedDialog(context);
//       } else if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location permission denied. Please enable it from settings.'),
//         ));
//       }
//     } else {
//       const LocationSettings locationSettings = LocationSettings(
//         accuracy: LocationAccuracy.high,
//         distanceFilter: 100,
//       );
//       Position position = await Geolocator.getCurrentPosition(
//           locationSettings: locationSettings);
//       addMarker(position.latitude, position.longitude, 'My current Location');
//       changeCameraPosition(position.latitude, position.longitude);
//     }
//     notifyListeners();
//   }
//
//   Future<void> locateUser(BuildContext context) async {
//     Position position = await Geolocator.getCurrentPosition();
//     _currentLocation =
//         LatLng(position.latitude, position.longitude); // Store current location
//     addMarker(position.latitude, position.longitude, 'My current Location');
//     changeCameraPosition(position.latitude, position.longitude);
//   }
//
// // after denied the location permission go to background permission
//   void _showPermissionDeniedDialog(context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Permission Denied'),
//         content: const Text(
//             'Location permissions are permanently denied. Please enable it from settings.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   LatLng? _currentLocation;
//   LatLng? _searchedLocation;
//   //add polyline concept
//   final Set<Polyline> polyLines = {};
//
//   void drawPolylineToSearchedPlace() {
//     if (_currentLocation != null && _searchedLocation != null) {
//       if (kDebugMode) {
//         print('hlllw');
//       }
//       final Polyline polyline = Polyline(
//         polylineId: const PolylineId('route'),
//         points: [_currentLocation!, _searchedLocation!],
//         width: 5,
//         color: Colors.blue,
//         geodesic: true,
//       );
//       polyLines.add(polyline);
//       notifyListeners();
//     }
//   }
// }




















import 'dart:async';
import 'dart:convert';
import 'dart:math'; // Importing math for calculations

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapViewModel with ChangeNotifier {
  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(26.9157806819305, 80.9580939971136),
    zoom: 14,
  );

  final Completer<GoogleMapController> completer =
  Completer<GoogleMapController>();

  final Set<Marker> markers = {};

  List<dynamic> _placeList = [];
  List<dynamic> get placeList => _placeList;

  void setPlaceData(List<dynamic> val) {
    _placeList = val;
    notifyListeners();
  }

  // Add marker
  void addMarker(double latitude, double longitude, String markerId) {
    markers.remove("marker_$markerId");
    markers.add(Marker(
      markerId: MarkerId('marker_$markerId'),
      position: LatLng(latitude, longitude),
      infoWindow: const InfoWindow(title: 'Selected Location'),
    ));
    changeCameraPosition(latitude, longitude);
    notifyListeners();
  }

  // Find lat lng using search place
  double _latSrc = 0.0;
  double _lngSrc = 0.0;
  double _latDes = 0.0;
  double _lngDes = 0.0;

  double get latSrc => _latSrc;
  double get lngSrc => _lngSrc;
  double get latDes => _latDes;
  double get lngDes => _lngDes;

  // Distance variable
  double _distance = 0.0; // Distance in meters
  double get distance => _distance; // Getter for distance

  void setPickupLatLng(double lat, double lng) {
    _latSrc = lat;
    _lngSrc = lng;
    _searchedLocation = LatLng(lat, lng);
    addMarker(_latSrc, _lngSrc, "searched Pickup location");
    _placeList.clear();

    if (_latDes != 0.0 && _lngDes != 0.0) {
      _distance = calculateDistance(_latSrc, _lngSrc, _latDes, _lngDes);
      print("Distance to destination: ${_distance / 1000} km"); // Convert to km
    } else {
      _distance = 0.0;
    }

    notifyListeners();
  }





  void setDestinationLatLng(double lat, double lng) {
    _distance=0.0;
    _latDes = lat;
    _lngDes = lng;
    _searchedLocation = LatLng(lat, lng);
    addMarker(_latDes, _lngDes, "searched Drop location");
    _placeList.clear();
    if (_latSrc != 0.0 && _lngSrc != 0.0) {
      _distance = calculateDistance(_latSrc, _lngSrc, _latDes, _lngDes);
      print("Distance from pickup: ${_distance / 1000} km"); // Convert to km
    } else {
      _distance = 0.0;
    }

    notifyListeners();
  }
  void clearFunction(){
    print('object');
    _latSrc=0.0;
    _lngSrc=0.0;
    _latDes=0.0;
    _lngDes=0.0;
    _distance=0.0;
    _searchedLocation=null;
    notifyListeners();
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    const earthRadius = 6371e3;

    final lat1Rad = lat1 * pi / 180;
    final lat2Rad = lat2 * pi / 180;
    final deltaLat = (lat2 - lat1) * pi / 180;
    final deltaLng = (lng2 - lng1) * pi / 180;

    final a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) *
            sin(deltaLng / 2) * sin(deltaLng / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  // Search location API
  Future<void> placeSearchApi(dynamic searchCon) async {

    markers.clear();
    notifyListeners();

    Uri uri = Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": searchCon,
      "key": "AIzaSyDpn7sjPxjUUi7tgAKpPHUjplrANUYNov8",
      "components": "country:in",
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      final resData = jsonDecode(response.body)['predictions'];
      if (resData != null) {
        setPlaceData(resData);
      }
    } else {
      if (kDebugMode) {
        print('Error fetching suggestions: ${response.body}');
      }
    }
  }

  // Search place details
  Future<dynamic> getPlaceDetails(String placeId) async {
    var res = await http.get(
      Uri.parse(
          'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=AIzaSyDpn7sjPxjUUi7tgAKpPHUjplrANUYNov8'),
    );
    if (kDebugMode) {
      print(res.body);
    }
    if (res.statusCode == 200) {
      final resData = jsonDecode(res.body)['result']['geometry']['location'];
      if (kDebugMode) {
        print("resData");
        print(resData);
      }
      return resData;
    } else {}
  }

  Future<void> changeCameraPosition(double lat, double lng) async {
    final GoogleMapController controller = await completer.future;
    CameraPosition givenLocation = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 14,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(givenLocation));
  }

  Future<void> checkAndRequestPermission(context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        _showPermissionDeniedDialog(context);
      } else if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permission denied. Please enable it from settings.'),
        ));
      }
    } else {
      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      addMarker(position.latitude, position.longitude, 'My current Location');
      changeCameraPosition(position.latitude, position.longitude);
    }
    notifyListeners();
  }

  Future<void> locateUser(BuildContext context) async {
    Position position = await Geolocator.getCurrentPosition();
    _currentLocation =
        LatLng(position.latitude, position.longitude); // Store current location
    addMarker(position.latitude, position.longitude, 'My current Location');
    changeCameraPosition(position.latitude, position.longitude);
  }

  // After denied the location permission go to background permission
  void _showPermissionDeniedDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Denied'),
        content: const Text(
            'Location permissions are permanently denied. Please enable it from settings.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  LatLng? _currentLocation;
  LatLng? _searchedLocation;
  // Add polyline concept
  final Set<Polyline> polyLines = {};

  void drawPolylineToSearchedPlace() {
    if (_currentLocation != null && _searchedLocation != null) {
      if (kDebugMode) {
        print('Drawing polyline...');
      }
      final Polyline polyline = Polyline(
        polylineId: const PolylineId('route'),
        points: [_currentLocation!, _searchedLocation!],
        width: 5,
        color: Colors.blue,
        geodesic: true,
      );
      polyLines.add(polyline);
      notifyListeners();
    }
  }
}
