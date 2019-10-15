import 'package:flutter/material.dart';

class MyNavigator {
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
    Navigator.pushNamed(context, "/formupload");
  }
  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }
  static void goToLogout(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
