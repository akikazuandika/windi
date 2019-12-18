import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'package:pariwisata/models/loginmodel.dart';
import 'package:pariwisata/networks/savelogin.dart';
import 'package:pariwisata/styles/alert.dart';
import 'package:pariwisata/styles/palete.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future requestLoginAPI(
    BuildContext context, String name, String pass) async {
  final progress = ProgressHUD.of(context);
  progress.showWithText('Mohon Menunggu...');
  final url ="${P.url}/auth/login";

  Map<String, String> data = {
    'username': name,
    'password': pass,
  };

  var body = json.encode(data);

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (response.statusCode == 200) {
    progress.dismiss();
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', true);
    prefs.setString('LastPassword', pass);

    final responseJson = json.decode(response.body);
    saveCurrentLogin(responseJson);
    Navigator.pushNamedAndRemoveUntil(context, '/Home', (_) => false);
    return null;
  } else {
    print(response.body);
    progress.dismiss();
    showErrorAlert(context, "Login Gagal",
        "\nMohon untuk mengisi Username & Password dengan benar");
    return null;
  }
}