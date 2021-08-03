import 'package:flutter/material.dart';
import 'package:macman/model/dailytimeprayer.dart';

class PrayerTimeRow extends StatelessWidget {
  final DailyPrayerTime dailyPrayerTime;
  final double paddingTop;
  PrayerTimeRow({@required this.dailyPrayerTime, this.paddingTop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                dailyPrayerTime.date,
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
                dailyPrayerTime.shubuh,
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
                dailyPrayerTime.shuruq,
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
                dailyPrayerTime.dzuhur,
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
                dailyPrayerTime.ashar,
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
                dailyPrayerTime.maghrib,
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
                dailyPrayerTime.isya,
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
    );
  }
}
