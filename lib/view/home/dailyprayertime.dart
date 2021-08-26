import 'package:flutter/material.dart';
import 'package:macman/model/dailytimeprayer.dart';
import 'package:macman/view/home/home.dart';
import 'package:macman/view/home/monitoring.dart';
import 'package:macman/widgets/prayertimerow.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

import 'package:hijri/hijri_calendar.dart';

class DailyPrayerTimePage extends StatefulWidget {
  @override
  _DailyPrayerTimePageState createState() => _DailyPrayerTimePageState();
}

class _DailyPrayerTimePageState extends State<DailyPrayerTimePage> {
  GlobalKey<FormState> finalFormKey = GlobalKey<FormState>();
  DateTime today = new DateTime.now();
  String formatTanggal(DateTime date) {
    return DateFormat.yMMMEd().format(date);
  }

  String locale = 'ar';

  HijriCalendar _today;

  Position _currentPosition;
  String _currentAddress;
  @override
  void initState() {
    super.initState();
    _today = HijriCalendar.fromDate(today);
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: Icon(
                Icons.west_outlined,
                color: Colors.black,
              ),
            );
          },
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "img/Location.png",
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  _currentAddress ?? '',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "AquawaxPro",
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Kemenag RI",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontFamily: "AquawaxPro",
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                showMaterialModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: MediaQuery.of(context).size.height -
                            AppBar().preferredSize.height -
                            MediaQuery.of(context).padding.top,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              dense: true,
                              title: Text(
                                'Jumadil Awal 1441 H',
                                style: TextStyle(
                                    fontFamily: 'AquawaxPro',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Icon(
                                Icons.file_upload_outlined,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Tanggal',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'AquawaxPro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Shubuh',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'AquawaxPro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Shuruq',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'AquawaxPro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Dzuhur',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'AquawaxPro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Ashar',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'AquawaxPro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Maghrib',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'AquawaxPro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Isya`',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'AquawaxPro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height -
                                  AppBar().preferredSize.height -
                                  MediaQuery.of(context).padding.top -
                                  74,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: ListView(
                                  padding: EdgeInsets.all(0),
                                  children: geneteDailyPrayerTimeRow()),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Image.asset(
                'img/calender.png',
                color: Colors.black,
                width: 25,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
            leading: IconButton(
              icon: Icon(
                Icons.navigate_before_outlined,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  today = today.subtract(Duration(days: 1));
                  _today = HijriCalendar.fromDate(today);
                });
              },
            ),
            title: Text(
              formatTanggal(today),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                wordSpacing: 1,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              _today.toFormat("dd MMMM yyyy"),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 14,
                wordSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  today = today.add(Duration(days: 1));
                  _today = HijriCalendar.fromDate(today);
                });
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            leading: Image.asset(
              'img/Subuh.png',
              color: Colors.black,
              width: 50,
            ),
            title: Text(
              "Subuh",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Iqamah: 4:30",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "AquawaxPro",
                fontSize: 15,
              ),
            ),
            trailing: Text(
              "04:23",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(
            height: 0,
            thickness: 0,
            indent: 40,
            endIndent: 20,
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            leading: Image.asset(
              'img/Shuruq.png',
              color: Colors.black,
              width: 50,
            ),
            title: Text(
              "Shuruq",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Iqamah: 05:51",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "AquawaxPro",
                fontSize: 15,
              ),
            ),
            trailing: Text(
              "05:41",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 40,
            endIndent: 20,
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            leading: Image.asset(
              'img/Dzuhur.png',
              color: Colors.black,
              width: 50,
            ),
            title: Text(
              "Dzuhur",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Iqamah: 12:13",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "AquawaxPro",
                fontSize: 15,
              ),
            ),
            trailing: Text(
              "12:03",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 40,
            endIndent: 20,
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            leading: Image.asset(
              'img/Ashar.png',
              color: Colors.black,
              width: 50,
            ),
            title: Text(
              "Ashar",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Iqamah : 15:38",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "AquawaxPro",
                fontSize: 15,
              ),
            ),
            trailing: Text(
              "15:28",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 40,
            endIndent: 20,
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            leading: Image.asset(
              'img/Maghrib.png',
              color: Colors.black,
              width: 50,
            ),
            title: Text(
              "Maghrib",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Iqamah: 18:29",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "AquawaxPro",
                fontSize: 15,
              ),
            ),
            trailing: Text(
              "18:19",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 40,
            endIndent: 20,
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            leading: Image.asset(
              'img/isya.png',
              color: Colors.black,
              width: 50,
            ),
            title: Text(
              "Isya",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Iqamah: 19:42",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "AquawaxPro",
                fontSize: 15,
              ),
            ),
            trailing: Text(
              "19:32",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "AquawaxPro",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 40,
            endIndent: 20,
          ),
          // ModalBottomSheetDemo(),
        ],
      ),
    );
  }

  List<Widget> geneteDailyPrayerTimeRow() {
    List<Widget> widgets = [];
    List<DailyPrayerTime> prayertimes = [
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
      DailyPrayerTime(
        date: "99 Jan",
        shubuh: "05:00",
        shuruq: "05:00",
        dzuhur: "12:00",
        ashar: "15:00",
        maghrib: "18:00",
        isya: "20:00",
      ),
    ];
    for (int i = 0; i < 31; i++) {
      if (i == 0) {
        widgets.add(PrayerTimeRow(
          dailyPrayerTime: prayertimes[i],
          paddingTop: 5,
        ));
      } else {
        widgets.add(PrayerTimeRow(
          dailyPrayerTime: prayertimes[i],
        ));
      }
    }
    return widgets;
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
