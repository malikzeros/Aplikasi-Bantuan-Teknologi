import 'package:flutter/material.dart';
import 'package:bantek/pages/homeuser_screen.dart';
import 'package:bantek/pages/homeadmin_screen.dart';
import 'package:bantek/pages/formupload_screen.dart';
import 'package:bantek/pages/formbantek_screen.dart';
import 'package:bantek/pages/login_screen.dart';
import 'package:bantek/pages/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  "/homeuser": (BuildContext context) => HomeUserScreen(),
  "/homeadmin": (BuildContext context) => HomeAdminScreen(),
  "/formupload": (BuildContext context) => FormUpload(),
  "/formbantek": (BuildContext context) => FormBantek(),
  "/login": (BuildContext context) => LoginScreen(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));
 
