import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GlobalKey<FormState> finalFormKey = GlobalKey<FormState>();

  double latitude;
  double longitude;

  final Set<Marker> _markers = {};
  LatLng _currentPosition = LatLng(-7.5943908231109525, 110.93867810051918);

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: MarkerId("-0.8971395757503112, 100.3507166778259"),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "Masjid Agung Karangayar"),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId("-0.8971395757503000, 100.3507166778000"),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "MAPS",
          style: TextStyle(
              fontFamily: "AquawaxPro",
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        automaticallyImplyLeading: true,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: _currentPosition, zoom: 12.0),
        markers: _markers,
      ),
    );
  }

  void _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position as LatLng;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
