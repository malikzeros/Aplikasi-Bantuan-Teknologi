//hotspot hp 192.168.43.231
//hotspot laptop 192.168.137.1
//dev gmf 172.16.40.190
//https://talentlead.gmf-aeroasia.co.id/images/avatar/532070.jpg
// static const String url = "https://api.banghasan.com/quran/format/json/surat";
import 'package:flutter/material.dart';
import 'package:bantek/pages/homeuser_screen.dart';
import 'package:bantek/pages/homeadmin_screen.dart';
import 'package:bantek/pages/formupload_screen.dart';
import 'package:bantek/pages/formbantek_screen.dart';
import 'package:bantek/pages/login_screen.dart';
import 'package:bantek/pages/splash_screen.dart';
class Bantek {
  static const String server_url='http://192.168.137.1';
  static const String name = "BANTEK APP";
  static const String store = "Bantek Online Mobile Apps";
  static const String wt1 = "WELCOME";
  static const String wc1 = "Please login to continue using this app";
  static const String url_list = server_url+"/bantek_api/tripList_api.php";
  static const String url_submit_status = server_url+"/bantek_api/submit_status.php";
  static const String url_submit_form = server_url+"/bantek_api/submit_form.php";
  static const String url_login = server_url+"/bantek_api/login.php";
  static const String url_airport = server_url+"/bantek_api/airport_api.php";
  static const String url_uploads_sppd = server_url+"/bantek_api/update_sppd.php";
  static const String url_uploads_tiket = server_url+"/bantek_api/update_tiket.php";
  static const String url_uploads_invoice = server_url+"/bantek_api/update_invoice.php";
  static const String url_uploads_voucher = server_url+"/bantek_api/update_voucher.php";
  static const String url_uploads_aml = server_url+"/bantek_api/update_aml.php";
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
  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }
  static void goToLogout(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
