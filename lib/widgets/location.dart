// import 'package:flutter/material.dart';
// import 'package:macman/model/location.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';

// class Location extends StatefulWidget {
//   @override
//   _LocationState createState() => _LocationState();
// }

// class _LocationState extends State<Location> {
//   final LocationService locationService;
//   _LocationState(this.locationService);

//   Position _currentPosition;
//   String _currentAddress;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _getCurrentLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       _currentAddress ?? '',
//       style: TextStyle(
//           color: Colors.black,
//           fontFamily: "AquawaxPro",
//           fontSize: 12,
//           fontWeight: FontWeight.bold),
//     );
//   }

//   _getCurrentLocation() {
//     Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.best,
//             forceAndroidLocationManager: true)
//         .then((Position position) {
//       setState(() {
//         _currentPosition = position;
//         _getAddressFromLatLng();
//       });
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   _getAddressFromLatLng() async {
//     try {
//       final coordinates =
//           Coordinates(_currentPosition.latitude, _currentPosition.longitude);
//       List<Address> addresses =
//           await Geocoder.local.findAddressesFromCoordinates(coordinates);
//       Address place = addresses.first;

//       print(place);
//       setState(() {
//         _currentAddress =
//             "${place.locality}, ${place.postalCode}, ${place.countryName}";
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
// }
