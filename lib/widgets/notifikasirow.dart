import 'package:flutter/material.dart';
import 'package:macman/model/notifmodel.dart';

class NotifikasiRow extends StatelessWidget {
  final DailyNotification dailyNotification;

  NotifikasiRow({@required this.dailyNotification});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        leading: Image.asset(
          'img/kotak.png',
          color: Colors.grey,
          width: 50,
        ),
        dense: true,
        title: Text(
          dailyNotification.judul,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: "AquawaxPro",
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          dailyNotification.isi,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
              fontFamily: "AquawaxPro",
              fontSize: 11,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
