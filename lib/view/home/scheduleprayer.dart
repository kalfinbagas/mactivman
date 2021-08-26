import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:macman/view/home/home.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:geolocator/geolocator.dart';

class SchedulePrayer extends StatefulWidget {
  @override
  _SchedulePrayerState createState() => _SchedulePrayerState();
}

class _SchedulePrayerState extends State<SchedulePrayer> {
  final int minValue = -30;
  final int maxValue = 30;
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();

  Position _currentPosition;
  double latitude;
  double longitude;

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Kementrian Agama RI',
      'label': 'Kementrian Agama RI',
    },
    {
      'value': 'Muhammadiyah',
      'label': 'Muhammadiyah',
    },
    {
      'value': 'Nahdatul Ulama',
      'label': 'Nahdatul Ulama',
    },
  ];
  int _shubuh = 0;
  int _shuruq = 0;
  int _dzuhur = 0;
  int _ashar = 0;
  int _maghrib = 0;
  int _isya = 0;

  DateTime shubuh = DateTime.parse('2021-01-01 04:20:00');
  DateTime shuruq = DateTime.parse('2021-01-01 06:00:00');
  DateTime dzuhur = DateTime.parse('2021-01-01 11:15:00');
  DateTime ashar = DateTime.parse('2021-01-01 03:15:00');
  DateTime maghrib = DateTime.parse('2021-01-01 05:48:00');
  DateTime isya = DateTime.parse('2021-01-01 07:10:00');

  String formatJam(DateTime date) {
    return DateFormat('kk:mm a').format(date);
  }

  int _n = 0;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(
                  Icons.west_outlined,
                  color: Colors.black,
                ),
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
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    "Jadwal Sholat",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "AquawaxPro",
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Longitude",
                          style: TextStyle(
                            fontFamily: "AquawaxPro",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 0, 10),
                        child: Container(
                          width: 140,
                          height: 30,
                          child: TextFormField(
                            controller: _longitudeController,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              fillColor: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Latitude",
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 30, 10),
                        child: Container(
                          width: 140,
                          height: 30,
                          child: TextFormField(
                            controller: _latitudeController,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Metode Perhitungan",
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: 380,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, top: 10, bottom: 10),
                          child: SelectFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            type: SelectFormFieldType.dropdown,
                            initialValue: 'Kementrian Agama RI',
                            labelText: 'Pilih...',
                            items: _items,
                            onChanged: (val) => print(val),
                            onSaved: (val) => print(val),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              height: 10,
              thickness: 5,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15.0),
              child: Text(
                "Penyusuaian Waktu Shalat",
                style: TextStyle(
                    fontFamily: "AquawaxPro",
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shubuh",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${formatJam(shubuh)}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_shubuh > minValue) {
                                  _shubuh--;
                                  shubuh =
                                      shubuh.subtract(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                          Text(
                            '$_shubuh',
                            style: TextStyle(
                              fontFamily: "AquawaxPro",
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_shubuh < maxValue) {
                                  _shubuh++;
                                  shubuh = shubuh.add(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Divider(
                height: 10,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shuruq",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${formatJam(shuruq)}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_shuruq > minValue) {
                                  _shuruq--;
                                  shuruq =
                                      shuruq.subtract(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                          Text(
                            '$_shuruq',
                            style: TextStyle(
                              fontFamily: "AquawaxPro",
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_shuruq < maxValue) {
                                  _shuruq++;
                                  shuruq = shuruq.add(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Divider(
                height: 10,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dzuhur",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${formatJam(dzuhur)}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_dzuhur > minValue) {
                                  _dzuhur--;
                                  dzuhur =
                                      dzuhur.subtract(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                          Text(
                            "$_dzuhur",
                            style: TextStyle(
                              fontFamily: "AquawaxPro",
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_dzuhur < maxValue) {
                                  _dzuhur++;
                                  dzuhur = dzuhur.add(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Divider(
                height: 10,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ashar",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${formatJam(ashar)}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_ashar > minValue) {
                                  _ashar--;
                                  ashar = ashar.subtract(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                          Text(
                            "$_ashar",
                            style: TextStyle(
                              fontFamily: "AquawaxPro",
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_ashar < maxValue) {
                                  _ashar++;
                                  ashar = ashar.add(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Divider(
                height: 10,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Maghrib",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${formatJam(maghrib)}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_maghrib > minValue) {
                                  _maghrib--;
                                  maghrib =
                                      maghrib.subtract(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                          Text(
                            "$_maghrib",
                            style: TextStyle(
                              fontFamily: "AquawaxPro",
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_maghrib < maxValue) {
                                  _maghrib++;
                                  maghrib = maghrib.add(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Divider(
                height: 10,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Isya`",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${formatJam(isya)}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "AquawaxPro",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_isya > minValue) {
                                  _isya--;
                                  isya = isya.subtract(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                          Text(
                            "$_isya",
                            style: TextStyle(
                              fontFamily: "AquawaxPro",
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_isya < maxValue) {
                                  _isya++;
                                  isya = isya.add(Duration(minutes: 1));
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Divider(
                height: 10,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff20EA96),
                    elevation: 2.0,
                    textStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "Simpan",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    // if (final_formKey.currentState.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    // }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _longitudeController.text = position.longitude.toStringAsFixed(6);
        _latitudeController.text = position.latitude.toStringAsFixed(6);
      });
      print(_longitudeController.text);
    }).catchError((e) {
      print(e);
    });
  }
}
