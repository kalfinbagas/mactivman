import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:macman/view/home/home.dart';
import 'package:macman/widgets/alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> finalFormKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _text = TextEditingController();
  bool _obscureText = true;

  bool _validate = false;

  void _toogle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            key: finalFormKey,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /**********LOGO ATAS ***********/
                      Container(
                        child: Image.asset(
                          'img/circlelogo.png',
                          height: 43.0,
                        ),
                      ),
                      /**********END  OFF LOGO ATAS ***********/
                      SizedBox(
                        height: 10.0,
                      ),
                      /**********TEXT ATAS**********/
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Selamat datang di ",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "AquawaxPro",
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "MacMan,",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "AquawaxPro",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          'Silahkan Login',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "AquawaxPro",
                          ),
                        ),
                      ),
                      /**********END OF TEXT ATAS**********/
                      SizedBox(
                        height: 25.0,
                      ),

                      /**********FORM LOGIN**********/
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: "AquawaxPro",
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: new InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: "Masukan Email Anda",
                          labelText: " Masukan Email Anda ",
                        ),
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: "AquawaxPro",
                          color: Colors.grey,
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                      Container(
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "AquawaxPro",
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintText: "Masukan Password Anda",
                            labelText: "Masukan Password Anda",
                            suffix: IconButton(
                              onPressed: _toogle,
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          style: TextStyle(
                            fontFamily: "AquawaxPro",
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      /**********END OF FORM LOGIN**********/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              "Lupa Password?",
                              style: TextStyle(
                                color: const Color(0xff02EA97),
                                fontFamily: "AquawaxPro",
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      // ignore: deprecated_member_use
                    ],
                  ),
                ),
                /**********BUTTON LOGIN**********/
                Positioned(
                  bottom: 60,
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
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (emailController.text == "" &&
                              passwordController.text == "") {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Isikan Email & Password Anda"),
                                    titleTextStyle: TextStyle(
                                        fontFamily: "AquawaxPro",
                                        fontSize: 20,
                                        color: Colors.black),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                });
                          } else if (emailController.text == "") {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Isikan Email Anda"),
                                    titleTextStyle: TextStyle(
                                        fontFamily: "AquawaxPro",
                                        fontSize: 20,
                                        color: Colors.black),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                });
                          } else if (passwordController.text == "") {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Isikan Password Anda"),
                                    titleTextStyle: TextStyle(
                                        fontFamily: "AquawaxPro",
                                        fontSize: 20,
                                        color: Colors.black),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }

                          // setState(() {
                          //   _text.text.isEmpty
                          //       ? _validate = true
                          //       : _validate = false;
                          // });

                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => MyStatelessWidget()),
                          // );
                        }),
                  ),
                ),
                /**********END OF BUTTON LOGIN**********/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
