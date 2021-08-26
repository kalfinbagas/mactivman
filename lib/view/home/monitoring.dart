import 'package:flutter/material.dart';
import 'package:macman/model/notifmodel.dart';
import 'package:macman/widgets/chart.dart';
import 'package:macman/widgets/notifikasirow.dart';

class MonitoringPage extends StatefulWidget {
  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  GlobalKey<FormState> finalFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    const double buttonPadding = 20;
    Size size = MediaQuery.of(context).size;
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
          "App Monitoring",
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
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: buttonPadding, right: buttonPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: buttonWidth,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xff4A46E7),
                        ),
                      ),
                      onPressed: null,
                      child: Text(
                        'Session',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AquawaxPro",
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: buttonWidth,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xff4A46E7),
                        ),
                      ),
                      onPressed: null,
                      child: Text(
                        'User Activity',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AquawaxPro",
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: buttonPadding, right: buttonPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: buttonWidth,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xff4A46E7),
                        ),
                      ),
                      onPressed: null,
                      child: Text(
                        'Error History',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AquawaxPro",
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: buttonWidth,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xff4A46E7),
                        ),
                      ),
                      onPressed: null,
                      child: Text(
                        'Server Status',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AquawaxPro",
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 40),
              child: Text(
                "Active Users",
                style: TextStyle(
                    fontFamily: "AquawaxPro",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 40,
                right: 40,
                bottom: 20,
                top: 10,
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
            Padding(
              padding: EdgeInsets.only(top: 0, left: 40),
              child: Text(
                "Sessions",
                style: TextStyle(
                    fontFamily: "AquawaxPro",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 40,
                right: 40,
                bottom: 20,
                top: 10,
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
            Padding(
              padding: EdgeInsets.only(top: 10, left: 40),
              child: Text(
                "Error History",
                style: TextStyle(
                    fontFamily: "AquawaxPro",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 40,
                right: 40,
                bottom: 20,
                top: 10,
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
          ],
        ),
      ),
    );
  }
}
