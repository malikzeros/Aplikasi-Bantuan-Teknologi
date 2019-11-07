//https://talentlead.gmf-aeroasia.co.id/images/avatar/532070.jpg
import 'package:flutter/material.dart';
import 'package:bantek/pages/homeuser_screen.dart';
import 'package:bantek/pages/homeadmin_screen.dart';
import 'package:bantek/pages/formupload_screen.dart';
import 'package:bantek/pages/formbantek_screen.dart';
import 'package:bantek/pages/login_screen.dart';
import 'package:bantek/pages/splash_screen.dart';
import 'package:flutter/material.dart' as prefix0;
class Bantek {
  // static const String server_ip='192.168.137.1';
  static const String server_ip='172.16.137.91';
  static const String server_url='http://'+server_ip;
  static const String name = "BANTEK APP";
  static const String store = "Bantek Online Mobile Apps";
  static const String wt1 = "WELCOME";
  static const String wc1 = "Please login to continue using this app";
  static const String url_list = server_url+"/bantek_api/tripList_api.php";
  static const String url_sppd = server_url+"/bantek_api/sppd_api.php";
  static const String url_Currency = server_url+"/bantek_api/currency_api.php";
  static const String url_submit_status = server_url+"/bantek_api/submit_status.php";
  static const String url_submit_form = server_url+"/bantek_api/submit_form.php";
  static const String url_login = server_url+"/bantek_api/login.php";
  static const String url_airport = server_url+"/bantek_api/airport_api.php";
  static const String url_uploads_sppd = server_url+"/bantek_api/update_sppd.php";
  static const String url_uploads_tiket = server_url+"/bantek_api/update_tiket.php";
  static const String url_uploads_invoice = server_url+"/bantek_api/update_invoice.php";
  static const String url_uploads_voucher = server_url+"/bantek_api/update_voucher.php";
  static const String url_uploads_aml = server_url+"/bantek_api/update_aml.php";
  static const String url_list_aircraft = server_url+"/bantek_api/aircraft.jpg";
  static void goToHomeUser(BuildContext context) {
    Navigator.pushNamed(context, "/homeuser");
  }
  static void goToHomeAdmin(BuildContext context) {
    Navigator.pushNamed(context, "/homeadmin");
  }
  static void goToFormBantek(BuildContext context) {
    Navigator.pushNamed(context, "/formbantek");
  }
  static void goToFormUpload(BuildContext context) {
    //Navigator.pushNamed(context, "/formupload");
	Navigator.push(context,MaterialPageRoute(builder: (context) => FormUpload(),),);
  }
  static void goToFormBantekFromFrom(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormBantekFromTo(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormBantekFromTransit1(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormBantekFromTransit2(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormBantekFromTransit3(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormBantekFromTransit4(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormUploadFromSppd(BuildContext context) {
    // Navigator.pushReplacementNamed(context, "/formupload");
    // Navigator.popAndPushNamed(context, "/formupload");
    Navigator.of(context).pushNamedAndRemoveUntil('/formupload', (Route<dynamic> route) => false);
  }
  static void goToFormUploadFromCurrency(BuildContext context) {
    // Navigator.pushReplacementNamed(context, "/formupload");
    // Navigator.popAndPushNamed(context, "/formupload");
    Navigator.of(context).pushNamedAndRemoveUntil('/formupload', (Route<dynamic> route) => false);
  }
  //
  //********************** */
  //
  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }
  static void goToListAircraftFrom(BuildContext context) {
    Navigator.pushNamed(context, "/listaircraftfrom");
  }
  static void goToListAircraftTo(BuildContext context) {
    Navigator.pushNamed(context, "/listaircraftto");
  }
  static void goToListAircraftTransit1(BuildContext context) {
    Navigator.pushNamed(context, "/listaircrafttransit1");
  }
  static void goToListAircraftTransit2(BuildContext context) {
    Navigator.pushNamed(context, "/listaircrafttransit2");
  }
  static void goToListAircraftTransit3(BuildContext context) {
    Navigator.pushNamed(context, "/listaircrafttransit3");
  }
  static void goToListAircraftTransit4(BuildContext context) {
    Navigator.pushNamed(context, "/listaircrafttransit4");
  }
  static void goToListSppd(BuildContext context) {
    Navigator.pushNamed(context, "/listaircraftsppd");
  }
  static void goToListCurrency(BuildContext context) {
    Navigator.pushNamed(context, "/listaircraftcurrency");
  }
  static void goToLogout(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
