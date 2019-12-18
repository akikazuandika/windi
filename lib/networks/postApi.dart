import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:pariwisata/styles/alert.dart';
import 'package:pariwisata/styles/palete.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future postItem(BuildContext context,
    {String title, desc, city, prov, photo, token}) async {
  Map<String, String> data = {
    "title": title,
    "description": desc,
    "city": city,
    "province": prov,
    "photo": photo,
  };
  var body = json.encode(data);

  final progress = ProgressHUD.of(context);
  progress.showWithText('Mohon Menunggu...');
  final response = await http.post("https://api-windi.appneko.com/product",
      body: body,
      headers: {'Content-Type': 'application/json', 'token': token});

  print(response);
  print(token);

  if (response.statusCode == 200) {
    progress.dismiss();

    // Navigator.pop(context);
    // showDialogSingleButton(
    //     context, "Simpan Suksess", "Data Berhasil Disimpan", "OK");
    return response;
    // progress.dismiss();
    // // final prefs = await SharedPreferences.getInstance();
    // final responseJson = json.decode(response.body);

    // Navigator.pushNamedAndRemoveUntil(context, '/Home', (_) => false);
    // return null;
  } else {
    print(response.body);
    progress.dismiss();
    showErrorAlert(context, "Gagal Add Item",
        "\nMohon untuk mengisi Username & Password dengan benar");
    return null;
  }
}
