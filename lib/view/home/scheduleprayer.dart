import 'package:flutter/material.dart';
import 'package:macman/main.dart';
import 'package:macman/view/home/home.dart';
import 'package:select_form_field/select_form_field.dart';

class SchedulePrayer extends StatefulWidget {
  @override
  _SchedulePrayerState createState() => _SchedulePrayerState();
}

class _SchedulePrayerState extends State<SchedulePrayer> {
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                            height: 40,
                            child: TextFormField(
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                fillColor: Colors.grey,
                                labelText: '-87,900',
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
                            height: 40,
                            child: TextFormField(
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                fillColor: Colors.white,
                                labelText: '-87,900',
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
                          "4:20 A.M",
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
                            Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                fontFamily: "AquawaxPro",
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            )
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
                          "6:00 A.M",
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
                            Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xffF3F3F4),
                            ),
                            Text(
                              "-30",
                              style: TextStyle(
                                fontFamily: "AquawaxPro",
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            )
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
                          "11:55 A.M",
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
                            Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                fontFamily: "AquawaxPro",
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            )
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
                          "3:15 P.M",
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
                            Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            Text(
                              "15",
                              style: TextStyle(
                                fontFamily: "AquawaxPro",
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            )
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
                          "5:48 P.M",
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
                            Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                fontFamily: "AquawaxPro",
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            )
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
                          "7:10 P.M",
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
                            Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            ),
                            Text(
                              "3",
                              style: TextStyle(
                                fontFamily: "AquawaxPro",
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: Color(0xff21ED99),
                            )
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
      ),
    );
  }
}
