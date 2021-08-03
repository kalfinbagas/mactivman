import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:macman/model/dailytimeprayer.dart';
import 'package:macman/view/home/home.dart';
import 'package:macman/widgets/prayertimerow.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DailyPrayerTimePage extends StatefulWidget {
  @override
  _DailyPrayerTimePageState createState() => _DailyPrayerTimePageState();
}

class _DailyPrayerTimePageState extends State<DailyPrayerTimePage> {
  GlobalKey<FormState> finalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    "Bogor Timur",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "AquawaxPro",
                      fontSize: 15,
                    ),
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
              leading: Icon(
                Icons.navigate_before_outlined,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                "Minggu, 4 Agustus 2019",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "AquawaxPro",
                  wordSpacing: 1,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "3 Dhu'l-Hijjah 1440 H",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "AquawaxPro",
                  fontSize: 14,
                  wordSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.black,
                size: 30,
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
                "Iqamah : 4:30",
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
                "Iqamah : 05:51",
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
                "Iqamah : 12:13",
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
                "Iqamah : 18:29",
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
                "Iqamah : 19:42",
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
}
