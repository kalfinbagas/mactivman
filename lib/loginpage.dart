import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> final_formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String _password;
  void _toogle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: SafeArea(
            child: Scaffold(
      body: Form(
        key: final_formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Masukan Email Anda",
                  labelText: "Masukan Email Anda",
                  icon: const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Icon(Icons.people)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Masukan Password Anda",
                    labelText: "Masukan Password Anda",
                    icon: const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Icon(Icons.lock))),
                validator: (value) =>
                    value.length < 6 ? 'password too short.' : null,
                onSaved: (value) => _password = value,
                obscureText: _obscureText,
              ),
              // ignore: deprecated_member_use
              new FlatButton(
                  onPressed: _toogle,
                  child: new Text(_obscureText ? "Show" : "Hide")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    if (final_formKey.currentState.validate()) {}
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
