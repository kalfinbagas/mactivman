import 'package:flutter/material.dart';
import 'package:macman/model/notifmodel.dart';
import 'package:macman/widgets/notifikasirow.dart';

class BroadcastPage extends StatefulWidget {
  @override
  _BroadcastPageState createState() => _BroadcastPageState();
}

class _BroadcastPageState extends State<BroadcastPage> {
  GlobalKey<FormState> finalFormKey = GlobalKey<FormState>();
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
          "Broadcast",
          style: TextStyle(
              fontFamily: "AquawaxPro",
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: ListView(
          children: geneteDailyNotivicationRow(),
        ),
      ),
    );
  }

  List<Widget> geneteDailyNotivicationRow() {
    List<Widget> widgets = [];
    List<DailyNotification> notif = [
      DailyNotification(
          judul: "Penguman Video telah hadir di Mactiv Box ",
          isi:
              "Upgrade aplikasi Mactic ke versi tebaru(v2.1.3) di  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as"),
      DailyNotification(
          tanggal: "9 Juli",
          judul: "Penguman Video telah hadir di Mactiv Box ",
          isi:
              "Upgrade aplikasi Mactic ke versi tebaru(v2.1.3) di  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as"),
      DailyNotification(
          judul: "Penguman Video telah hadir di Mactiv Box ",
          isi:
              "Upgrade aplikasi Mactic ke versi tebaru(v2.1.3) di  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as"),
      DailyNotification(
          judul: "Penguman Video telah hadir di Mactiv Box ",
          isi:
              "Upgrade aplikasi Mactic ke versi tebaru(v2.1.3) di  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as"),
      DailyNotification(
          judul: "Penguman Video telah hadir di Mactiv Box ",
          isi:
              "Upgrade aplikasi Mactic ke versi tebaru(v2.1.3) di  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as"),
      DailyNotification(
          tanggal: "9 Juli",
          judul: "Penguman Video telah hadir di Mactiv Box ",
          isi:
              "Upgrade aplikasi Mactic ke versi tebaru(v2.1.3) di  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as"),
      DailyNotification(
          tanggal: "9 Juli",
          judul: "Penguman Video telah hadir di Mactiv Box ",
          isi:
              "Upgrade aplikasi Mactic ke versi tebaru(v2.1.3) di  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as"),
      DailyNotification(
          tanggal: "9 Juli",
          judul: "Penguman Video telah hadir di Mactiv Box ",
          isi:
              "Upgrade aplikasi Mactic ke versi tebaru(v2.1.3) di  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as  adsad asdas asd asd as asd asd  asd as"),
    ];
    for (int i = 0; i < 8; i++) {
      widgets.add(NotifikasiRow(
        dailyNotification: notif[i],
      ));
    }
    return widgets;
  }
}
