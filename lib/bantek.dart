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
  //   static const String server_ip='192.168.137.1';
static const String server_ip='172.16.137.34';
  static const String server_url='http://'+server_ip;
  static const String name = "BANTEK APP";
  static const String store = "Bantek Online Mobile Apps";
  static const String wt1 = "WELCOME";
  static const String wc1 = "Please login to continue using this app";
  static const String url_list = server_url+"/bantek_api/tripList_api.php";
  static const String url_sppd = server_url+"/bantek_api/getApiSppdPostgre.php?nopeg=";
  static const String url_airport = server_url+"/bantek_api/getApiAirportPostgre.php";
  static const String url_Currency = server_url+"/bantek_api/currency_api.php";
  static const String url_voucher_tiket= server_url+"/bantek_api/getVoucherAndTicket.php?travel_request_id=";
  static const String url_submit_status = server_url+"/bantek_api/submit_status.php";
  static const String url_submit_form = server_url+"/bantek_api/submit_form.php";
  static const String url_login = server_url+"/bantek_api/login.php";
  static const String url_uploads_sppd = server_url+"/bantek_api/update_sppd.php";
  static const String url_uploads_tiket = server_url+"/bantek_api/update_tiket.php";
  static const String url_uploads_invoice = server_url+"/bantek_api/update_invoice.php";
  static const String url_uploads_voucher = server_url+"/bantek_api/update_voucher.php";
  static const String url_uploads_aml = server_url+"/bantek_api/update_aml.php";
  static const String url_list_aircraft = server_url+"/bantek_api/aircraft.jpg";
  static void goToHomeUser(BuildContext context) {
    // Navigator.pushNamed(context, "/homeuser");
    Navigator.of(context).pushReplacementNamed('/homeuser');
    // Navigator.of(context).pushNamedAndRemoveUntil('/homeuser', (Route<dynamic> route) => false);
  }
  static void goToHomeAdmin(BuildContext context) {
    // Navigator.pushNamed(context, "/homeadmin");
    Navigator.of(context).pushReplacementNamed('/homeadmin');
    // Navigator.of(context).pushNamedAndRemoveUntil('/homeadmin', (Route<dynamic> route) => false);
  }
  static void goToFormBantek(BuildContext context) {
    // Navigator.pushNamed(context, "/formbantek");
    Navigator.of(context).pushReplacementNamed('/formbantek');
    // Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
  }
  static void goToFormUpload(BuildContext context) {
    //Navigator.pushNamed(context, "/formupload");
    Navigator.of(context).pushReplacementNamed('/formupload');
    // Navigator.of(context).pushNamedAndRemoveUntil('/formupload', (Route<dynamic> route) => false);
	// Navigator.push(context,MaterialPageRoute(builder: (context) => FormUpload(),),);
  }
  static void goToFormBantekFromFrom(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/formbantek');
    // Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormBantekFromTo(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/formbantek');
    // Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormBantekFromTransit1(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/formbantek');
    // Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormBantekFromTransit2(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/formbantek');
    // Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormBantekFromTransit3(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/formbantek');
    // Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormBantekFromTransit4(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/formbantek');
    // Navigator.of(context).pushNamedAndRemoveUntil('/formbantek', (Route<dynamic> route) => false);
    // Navigator.popAndPushNamed(context, "/formbantek");
  }
  static void goToFormUploadFromSppd(BuildContext context) {
    // Navigator.pushReplacementNamed(context, "/formupload");
    // Navigator.popAndPushNamed(context, "/formupload");
    Navigator.of(context).pushReplacementNamed('/formupload');
    // Navigator.of(context).pushNamedAndRemoveUntil('/formupload', (Route<dynamic> route) => false);
  }
  static void goToFormUploadFromCurrency(BuildContext context) {
    // Navigator.pushReplacementNamed(context, "/formupload");
    // Navigator.popAndPushNamed(context, "/formupload");
    Navigator.of(context).pushReplacementNamed('/formupload');
    // Navigator.of(context).pushNamedAndRemoveUntil('/formupload', (Route<dynamic> route) => false);
  }
  //
  //********************** */
  //
  static void goToLogin(BuildContext context) {
    // Navigator.pushNamed(context, "/login");
    Navigator.of(context).pushReplacementNamed('/login');
    // Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
  static void goToListAircraftFrom(BuildContext context) {
    // Navigator.pushNamed(context, "/listaircraftfrom");
    Navigator.of(context).pushReplacementNamed('/listaircraftfrom');
    // Navigator.of(context).pushNamedAndRemoveUntil('/listaircraftfrom', (Route<dynamic> route) => false);
  }
  static void goToListAircraftTo(BuildContext context) {
    // Navigator.pushNamed(context, "/listaircraftto");
    Navigator.of(context).pushReplacementNamed('/listaircraftto');
    // Navigator.of(context).pushNamedAndRemoveUntil('/listaircraftto', (Route<dynamic> route) => false);
  }
  static void goToListAircraftTransit1(BuildContext context) {
    // Navigator.pushNamed(context, "/listaircrafttransit1");
    Navigator.of(context).pushReplacementNamed('/listaircrafttransit1');
    // Navigator.of(context).pushNamedAndRemoveUntil('/listaircrafttransit1', (Route<dynamic> route) => false);
  }
  static void goToListAircraftTransit2(BuildContext context) {
    // Navigator.pushNamed(context, "/listaircrafttransit2");
    Navigator.of(context).pushReplacementNamed('/listaircrafttransit2');
    // Navigator.of(context).pushNamedAndRemoveUntil('/listaircrafttransit2', (Route<dynamic> route) => false);
  }
  static void goToListAircraftTransit3(BuildContext context) {
    // Navigator.pushNamed(context, "/listaircrafttransit3");
    Navigator.of(context).pushReplacementNamed('/listaircrafttransit3');
    // Navigator.of(context).pushNamedAndRemoveUntil('/listaircrafttransit3', (Route<dynamic> route) => false);
  }
  static void goToListAircraftTransit4(BuildContext context) {
    // Navigator.pushNamed(context, "/listaircrafttransit4");
    Navigator.of(context).pushReplacementNamed('/listaircrafttransit4');
    // Navigator.of(context).pushNamedAndRemoveUntil('/listaircrafttransit4', (Route<dynamic> route) => false);
  }
  static void goToListSppd(BuildContext context) {
    // Navigator.pushNamed(context, "/listaircraftsppd");
    Navigator.of(context).pushReplacementNamed('/listaircraftsppd');
    // Navigator.of(context).pushNamedAndRemoveUntil('/listaircraftsppd', (Route<dynamic> route) => false);
  }
  static void goToListCurrency(BuildContext context) {
    // Navigator.pushNamed(context, "/listaircraftcurrency");
    Navigator.of(context).pushReplacementNamed('/listaircraftcurrency');
    // Navigator.of(context).pushNamedAndRemoveUntil('/listaircraftcurrency', (Route<dynamic> route) => false);
  }
  static void goToLogout(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/login');
    // Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
