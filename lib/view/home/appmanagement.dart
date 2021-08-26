import 'package:flutter/material.dart';
import 'package:macman/model/notifmodel.dart';
import 'package:macman/view/home/maps.dart';
import 'package:macman/widgets/chart.dart';
import 'package:macman/widgets/notifikasirow.dart';

class AppManagementPage extends StatefulWidget {
  @override
  _AppManagementPageState createState() => _AppManagementPageState();
}

class _AppManagementPageState extends State<AppManagementPage> {
  GlobalKey<FormState> finalFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    const double buttonPadding = 20;
    Size size = MediaQuery.of(context).size;
    double bodyHeight = size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.bottom;
    double buttonHeight = (bodyHeight - 80 - 40) / 4;
    double buttonWidth = (size.width - buttonPadding * 2 - 10) / 2;
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
          "App Management",
          style: TextStyle(
              fontFamily: "AquawaxPro",
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: buttonHeight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xff19DD89),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MapsPage()));
                  },
                  child: Text(
                    'Session',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "AquawaxPro",
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: buttonHeight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xff19DD89),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: null,
                  child: Text(
                    'User Activity',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "AquawaxPro",
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: buttonHeight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xff19DD89),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: null,
                  child: Text(
                    'Error History',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "AquawaxPro",
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: buttonHeight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xff19DD89),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: null,
                  child: Text(
                    'Server Status',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "AquawaxPro",
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
