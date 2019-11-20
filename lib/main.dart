import 'package:flutter/material.dart';
import 'package:bantek/pages/homeuser_screen.dart';
import 'package:bantek/pages/homeadmin_screen.dart';
import 'package:bantek/pages/formupload_screen.dart';
import 'package:bantek/pages/formbantek_screen.dart';
import 'package:bantek/pages/login_screen.dart';
import 'package:bantek/pages/splash_screen.dart';
import 'package:bantek/pages/list_aircraft_from_screen.dart';
import 'package:bantek/pages/list_aircraft_to_screen.dart';
import 'package:bantek/pages/list_aircraft_transit1_screen.dart';
import 'package:bantek/pages/list_aircraft_transit2_screen.dart';
import 'package:bantek/pages/list_aircraft_transit3_screen.dart';
import 'package:bantek/pages/list_aircraft_transit4_screen.dart';
import 'package:bantek/pages/list_aircraft_sppd_screen.dart';
import 'package:bantek/pages/list_aircraft_currency_screen.dart';

var routes = <String, WidgetBuilder>{
  "/homeuser": (BuildContext context) => HomeUserScreen(),
  "/homeadmin": (BuildContext context) => HomeAdminScreen(),
  "/formupload": (BuildContext context) => FormUpload(),
  "/formbantek": (BuildContext context) => FormBantek(),
  "/login": (BuildContext context) => LoginScreen(),
  "/listaircraftfrom": (BuildContext context) => ListAircraftFromScreen(),
  "/listaircraftto": (BuildContext context) => ListAircraftToScreen(),
  "/listaircrafttransit1": (BuildContext context) => ListAircraftTransit1Screen(),
  "/listaircrafttransit2": (BuildContext context) => ListAircraftTransit2Screen(),
  "/listaircrafttransit3": (BuildContext context) => ListAircraftTransit3Screen(),
  "/listaircrafttransit4": (BuildContext context) => ListAircraftTransit4Screen(),
  "/listaircraftsppd": (BuildContext context) => ListAircraftSPPDScreen(),
  "/listaircraftcurrency": (BuildContext context) => ListAircraftCurrencyScreen(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.blue, accentColor: Colors.green),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));
 
