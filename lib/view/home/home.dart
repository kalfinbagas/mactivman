import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:macman/model/home_model.dart';
import 'package:macman/view/home/dailyprayertime.dart';
import 'package:macman/view/home/notification.dart';
import 'package:macman/widgets/chart.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

import '../../widgets/clippath/ovalbottomclipper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MainMenuService> _mainMenuServiceList = [];

  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();

    _mainMenuServiceList.add(MainMenuService(
      image: "img/menubar1.png",
      title: "Jadwal \nSholat",
      page: '/schedule',
    ));
    _mainMenuServiceList.add(MainMenuService(
      image: "img/menubar2.png",
      title: "App \nMonitoring",
      page: '/monitoring',
    ));
    _mainMenuServiceList.add(new MainMenuService(
      image: "img/menubar3.png",
      title: "Data \nManagement",
      page: '/appmanagement',
    ));
    _mainMenuServiceList.add(new MainMenuService(
      image: "img/menubar4.png",
      title: "Broadcast",
      page: '/broadcast',
    ));
    _mainMenuServiceList.add(new MainMenuService(
      image: "img/menubar5.png",
      title: "Maintenance",
      page: '/',
    ));
    _mainMenuServiceList.add(new MainMenuService(
      image: "img/menubar6.png",
      title: "Store",
      page: '/',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: 70.0,
        backgroundColor: (const Color(0xff1EEC97)),
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 0.0),
          child: Image.asset(
            'img/brandmactiv.png',
            fit: BoxFit.cover,
            height: 30.0,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 25.0, bottom: 0.0),
            child: GestureDetector(
              child: Icon(
                Icons.notifications_outlined,
                size: 28.0,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotifikasiPage()),
                );
              },
            ),
          )
        ],
      ),
      body: new Container(
        child: new ListView(
          physics: ScrollPhysics(),
          children: <Widget>[
            new Container(
                // padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
                color: Colors.white,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        /************ BACKGROUND OVAL  ***********/
                        ClipPath(
                          clipper: OvalBottomClipper(),
                          child: Container(
                            height: 90.0,
                            color: (const Color(0xff1EEC97)),
                          ),
                        ),
                        _buildPrayerMenu(),
                      ],
                    ),
                    _buildMactivMenu(),

                    /************ CHART  ACTIVE USER  ***********/
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        'Active Users & Sessions',
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 40,
                        right: 40,
                        bottom: 40,
                        top: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: LineChartSample2(),
                      ),
                    ),
                    /************ END OF CHART ACTIVE USER  ***********/

                    /************ CHART  ERROR REPORT  ***********/
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        'Error Report',
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 40,
                        right: 40,
                        bottom: 40,
                        top: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: LineChartSample2(),
                      ),
                    ),
                    /************ END OF  CHART ERROR REPORT  ***********/
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {},
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 0,
                ),
                shape: BoxShape.circle,
                color: Color(0xff21EE9A),
              ),
              child: Icon(
                Icons.sync,
                size: 40,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Color(0xff21EE9A),
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '12',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '12',
          ),
        ],
      ),
    );
  }

  Widget _buildMactivMenu() {
    return SizedBox(
      width: double.infinity,
      height: 250.0,
      child: new Container(
        margin: EdgeInsets.only(right: 40.0, left: 40.0, bottom: 0.0),
        child: GridView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: 6,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, position) {
            return _rowMainMenuService(
              _mainMenuServiceList[position],
            );
          },
        ),
      ),
    );
  }

  Widget _rowMainMenuService(MainMenuService mainMenuService) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                mainMenuService.page,
              );
            },
            child: Container(
              child: Image.asset(
                mainMenuService.image,
                height: 60.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0),
          ),
          Text(mainMenuService.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600))
        ],
      ),
    );
  }

  _buildPrayerMenu() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DailyPrayerTimePage()),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
        height: 125.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0xff3E44DB), const Color(0xff5148EF)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xff3E44DB), const Color(0xff5148EF)],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          "NEXT PRAYER:",
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                            fontFamily: "AquawaxPro",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 2.0)),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 17.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20.0,
                            ),
                          ),
                          Text(
                            _currentAddress ?? '',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AquawaxPro",
                                fontSize: 12),
                          ),
                          // Text(_getCurrentLocation()),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        "img/awan.png",
                        color: Colors.white,
                        height: 40.0,
                        width: 37.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "MAGHRIB",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "AquawaxPro",
                          fontSize: 38.0,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        "18.08",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "AquawaxPro",
                          fontSize: 38.0,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      final coordinates =
          Coordinates(_currentPosition.latitude, _currentPosition.longitude);
      List<Address> addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      Address place = addresses.first;

      print(place);

      // List<Placemark> placemarks = await placemarkFromCoordinates(
      //     _currentPosition.latitude, _currentPosition.longitude);

      // Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.countryName}";
      });
    } catch (e) {
      print(e);
    }
  }
}
