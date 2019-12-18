import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

logoutUser(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.remove('login');
  await preferences.setString('LastEmail', "");
  await preferences.setString('LastName', "");
  await preferences.setString('LastToken', "");
  await preferences.setString('LastPhone', "");
  await preferences.setString('LastUsername', "");
  await preferences.setString('LastPassword', "");
  Navigator.of(context).pushNamedAndRemoveUntil('/Login', (Route<dynamic> route) => false); 
}
