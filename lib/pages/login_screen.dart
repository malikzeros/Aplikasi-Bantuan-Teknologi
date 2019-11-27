import 'package:flutter/material.dart';
import 'package:bantek/bantek.dart';
import 'package:bantek/widgets/walkthrough.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
class _LoginScreenState extends State<LoginScreen> {
 Future checklogin() async {
      try {
  final result = await InternetAddress.lookup(Bantek.server_ip);
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    print('connected');
  }
} on SocketException catch (_) {
  return showDialog(context: context,builder: (context) {return AlertDialog(content: Text("Cannot connect to Server"),);
            },
          );
}
 }
 @override
 void initState() {
   this.checklogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logogmfblue.png'),
      ),
    );

    final username = TextField(
      // keyboardType: TextInputType.emailAddress,
      controller: usernameController,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Nopeg',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          var response = await http.post(Bantek.url_login, body: {'id': usernameController.text, 'password': passwordController.text},headers: { 'accept':'application/json' });
          var content = json.decode(response.body); 
		  print(content);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('nama', content['nama']);
          prefs.setString('nopeg', content['nopeg']);
          prefs.setString('unit', content['unit']);
          prefs.setString('email', content['email']);
          prefs.setString('token', content['token']);
          
          if(content['role']=='user')
          Bantek.goToHomeUser(context);
          else if(content['role']=='admin')
          Bantek.goToHomeAdmin(context);
          else
            return showDialog(context: context,builder: (context) {return AlertDialog(content: Text("Nopeg and Password Incorrect"),);
            },
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.blue,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );
    return WillPopScope(
      child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 50,
            width: 100, 
            child: Text(Bantek.wt1,style:TextStyle(color: Colors.green, fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
            SizedBox(height: 30,
            width: 50, 
            child: Text(Bantek.wc1,style: TextStyle(color: Colors.blue, fontSize: 12),textAlign: TextAlign.center)),
            SizedBox(height: 48.0),
            logo,
            SizedBox(height: 48.0),
            SizedBox(height: 50,
            width: 100, 
            child: Text(Bantek.name,style: TextStyle(color: Colors.green, fontSize: 24,fontWeight: FontWeight.bold), 
            textAlign: TextAlign.center)),
            username,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
        ),
      ),
    ), onWillPop: () {
      showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Keluar Aplikasi"),
          content: new Text("Apa kamu yakin mau keluar aplikasi?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                exit(0);
              },
            ),
          ],
        );
      },
    );
    },
    );
  }
}
